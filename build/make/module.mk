all: clean $(MODULE)

$(MODULE):$(OBJS)
	$(HIDE)mkdir -p $(G_OUTPUT_PATH)/$(MODULE_NAME)/lib
	$(HIDE)mkdir -p $(G_OUTPUT_PATH)/$(MODULE_NAME)/obj
	$(HIDE)$(AR) cr $@ $(OBJS)
	$(HIDE)mv $(MODULE) $(G_OUTPUT_PATH)/$(MODULE_NAME)/lib
	$(HIDE)mv $(OBJS) $(G_OUTPUT_PATH)/$(MODULE_NAME)/obj

%.o:%.c
	$(HIDE)$(CC) -c $(CFLAGS) $(LOCAL_FLAGS) -o $@ $<

%.o:%.S
	$(HIDE)$(CC) -c $(CFLAGS) $(LOCAL_FLAGS) -o $@ $<

clean:
	$(HIDE)rm -rf *.a *.o