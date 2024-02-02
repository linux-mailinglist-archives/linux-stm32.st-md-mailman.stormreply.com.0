Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12672849632
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Feb 2024 10:17:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2F8AC6907A;
	Mon,  5 Feb 2024 09:17:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60FE8C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 23:09:10 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d76671e5a4so20633745ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 15:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706915349; x=1707520149;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ns/bvPkKWqK4cT5hwWAJS7KQis8SRbW6Visd6BLTiUI=;
 b=BK700oKV3tpT1WOKbxTCxrpCcUgyySSieSSPTyC5j6ZYhmPezML/kdJ0t2RiKIHkS0
 MFpvbledEN4foWk/Kf4JlBukDnqQI1xZ5X6ulu4WuTaR8vtNx4YOd7rN9uItwoliaMX+
 Pkc/QXfSbhHw8mrOSsT5EJFKA9sNt3ZitFzJsUzsB7imai/krQFBykMHhTPpMeV0aq3Q
 Caf6TMLbiaz9AWODgCV710J3Ifn+3UHI1GLefVqUILo3Pl8j7ai+27zg3jopaeKHjO3p
 OGgMPbZcOEGTsYN6v7BXYssuEGXJb1iK0BrQUOWkYw3Jmm7CMZgReQ8m/J92VUWhcDwP
 r3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706915349; x=1707520149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ns/bvPkKWqK4cT5hwWAJS7KQis8SRbW6Visd6BLTiUI=;
 b=rwvPs5tKIlTTE/jOgqdMB7Lmd6BRQ7zR5LAQdhxcJnZNWj0wM9pAnin1NBqDAn73ny
 ZNss8uITklGSK6f7g0mNWPVcEYDhB3ptBtfKsEFSrC5lUHVg5sl0MxLlCr20bx07ai2K
 9SVSY/T+h07+Z6+GQUeD8gT4Qs6TFsQ1JCWYxlLzCdXxiD0Csnt3hQ+U7izg5IT+K3QU
 PGWUtbpw+EC6YqA2XuMp9D+A7p6kFwdQiKZAtOjBPqffMl+w9EZpCv/lVtxIOgEmo8Aq
 pS0XyP6CqlpUOFqSnrZt18FnBFV/hwM2qjDN4SyypzJw53ulWZOsf0lmNnufp2TUdIih
 /C0w==
X-Gm-Message-State: AOJu0YwpNJJhoXiOXRYDBaqMWPbyv0Izs9scHInZDNwGIDDrxvx7uBLT
 W1nsfe3vMcRB+R9o3JKgGTj7XWq5AoWmzdKTRxFHFq7flLv5vetTNwZhDeW+eRA=
X-Google-Smtp-Source: AGHT+IFxxTOrsdYhKRWr9e6jHbv8TCklGcEQIE8BSnW/BV4FuD23/hWYjE901pv5pKGyJLGFlLZjBQ==
X-Received: by 2002:a17:902:b194:b0:1d5:c08e:52eb with SMTP id
 s20-20020a170902b19400b001d5c08e52ebmr8168069plr.65.1706915348583; 
 Fri, 02 Feb 2024 15:09:08 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXh8AopKfi/YqWmfKiAwlQ/PCijITod0oFhPh7EZgbe4IqqVCTYplEzVZLk725jsEN7/jjrF3+q6jwqjZIAWgtFJwhn9qmdKmzSh1WTQWyzKIR3Vu1RR9VOQ/mVdMEOrdQtYnhjryw1mdCQexA9JgKi6G6x/jm8n0qLhDny1Uyh9vw8IV8OyRb46UVpGGduitQ9ram54QIx/Q4+QDflTEF+IDMbGP6LDutZoBqdGyGeIDaHWDuGJjeQGgpi3kWxY6Mxokz3ztlOAqOGqeQDd+PFxUQapdW8eUtWM9krlaYdDID3UIGv6Ao+xrLQWDCxkdxkdWrDdbxlfq5IiqlrLk7HA0UnJpJ4jkFfgWd75iHDEi8ZdxAD0XE06DRBlvejpEon3X1Owg03SqEYrAL6rJdyOqiuNnhveN6rok4raRhfJSFqktdoCqF5aru6yMErGbiCNxd0+0aDnqt1T1XYbEGqcirlu5DKCtQ6o6ulW7Vylya1gXBRqZMMo8UuNV9ealWnc8Uf9Vfw1XOhHZ4j41gYSibJO6X/qQ9m3wUuH/DVujlBkGxKAkVqWMc+Wc4KsIxm/EtloqOHI0LTPMMffFTsW5xMa5t9igm/5IU1NvJ0UaL1KXIbvnzxQdLod4WO3cP7eM+SLAzmpsRCYZ37BA3OS0HH2DSw/vYCAqccICCfyklhIqIq0wBZrEXbqubqWvBOtecAaQ==
Received: from surya ([70.134.61.176]) by smtp.gmail.com with ESMTPSA id
 c9-20020a170902d48900b001d9557f6c04sm2086428plg.267.2024.02.02.15.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 15:09:08 -0800 (PST)
Date: Fri, 2 Feb 2024 15:09:05 -0800
From: Manu Bretelle <chantr4@gmail.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Message-ID: <Zb12EZt0BAKOPBk/@surya>
References: <cover.1706491398.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1706491398.git.dxu@dxuuu.xyz>
X-Mailman-Approved-At: Mon, 05 Feb 2024 09:17:53 +0000
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com,
 linux-doc@vger.kernel.org, vmalik@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in
	.BTF_ids section
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sun, Jan 28, 2024 at 06:24:05PM -0700, Daniel Xu wrote:
> === Description ===
> 
> This is a bpf-treewide change that annotates all kfuncs as such inside
> .BTF_ids. This annotation eventually allows us to automatically generate
> kfunc prototypes from bpftool.
> 
> We store this metadata inside a yet-unused flags field inside struct
> btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> 
> More details about the full chain of events are available in commit 3's
> description.
> 
> The accompanying pahole and bpftool changes can be viewed
> here on these "frozen" branches [0][1].
> 
> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
> [1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed


I hit a similar issue to [0] on master
943b043aeecc ("selftests/bpf: Fix bench runner SIGSEGV")
 when cross-compiling on x86_64 (LE) to s390x (BE).
I do have CONFIG_DEBUG_INFO_BTF enable and the issue would not trigger if
I disabled CONFIG_DEBUG_INFO_BTF (and with the fix mentioned in [0]).

What seems to happen is that `tools/resolve_btfids` is ran in the context of the
host endianess and if I printk before the WARN_ON:
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index ef380e546952..a9ed7a1a4936 100644
  --- a/kernel/bpf/btf.c
  +++ b/kernel/bpf/btf.c
  @@ -8128,6 +8128,7 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
           * WARN() for initcall registrations that do not check errors.
           */
          if (!(kset->set->flags & BTF_SET8_KFUNCS)) {
  +        printk("Flag 0x%08X, expected 0x%08X\n", kset->set->flags, BTF_SET8_KFUNCS);
                  WARN_ON(!kset->owner);
                  return -EINVAL;
          }

the boot logs would show:
  Flag 0x01000000, expected 0x00000001

The issue did not happen prior to
6f3189f38a3e ("bpf: treewide: Annotate BPF kfuncs in BTF")
has only 0 was written before.

It seems [1] will be addressing cross-compilation, but it did not fix it as is
by just applying on top of master, so probably some of the changes will also need
to be ported to `tools/include/linux/btf_ids.h`?

A hacky workaround to cross-compilation I have is to apply:

  diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
  index 4b8079f294f6..b706e7ab066f 100644
  --- a/tools/bpf/resolve_btfids/Makefile
  +++ b/tools/bpf/resolve_btfids/Makefile
  @@ -22,10 +22,10 @@ HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)
                    CROSS_COMPILE="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
   RM      ?= rm
  -HOSTCC  ?= gcc
  -HOSTLD  ?= ld
  -HOSTAR  ?= ar
  -CROSS_COMPILE =
  +HOSTCC  = $(CC)
  +HOSTLD  = $(LD)
  +HOSTAR  = $(AR)
  +#CROSS_COMPILE =
   OUTPUT ?= $(srctree)/tools/bpf/resolve_btfids/
  @@ -56,16 +56,16 @@ $(OUTPUT) $(OUTPUT)/libsubcmd $(LIBBPF_OUT):
   $(SUBCMDOBJ): fixdep FORCE | $(OUTPUT)/libsubcmd
          $(Q)$(MAKE) -C $(SUBCMD_SRC) OUTPUT=$(SUBCMD_OUT) \
  -                   DESTDIR=$(SUBCMD_DESTDIR) $(HOST_OVERRIDES) prefix= subdir= \
  +                   DESTDIR=$(SUBCMD_DESTDIR) prefix= subdir= \
                      $(abspath $@) install_headers
   $(BPFOBJ): $(wildcard $(LIBBPF_SRC)/*.[ch] $(LIBBPF_SRC)/Makefile) | $(LIBBPF_OUT)
          $(Q)$(MAKE) $(submake_extras) -C $(LIBBPF_SRC) OUTPUT=$(LIBBPF_OUT)    \
  -                   DESTDIR=$(LIBBPF_DESTDIR) $(HOST_OVERRIDES) prefix= subdir= \
  +                   DESTDIR=$(LIBBPF_DESTDIR) prefix= subdir= \
                      $(abspath $@) install_headers
  -LIBELF_FLAGS := $(shell $(HOSTPKG_CONFIG) libelf --cflags 2>/dev/null)
  -LIBELF_LIBS  := $(shell $(HOSTPKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
  +LIBELF_FLAGS := $(shell $(PKG_CONFIG) libelf --cflags 2>/dev/null)
  +LIBELF_LIBS  := $(shell $(PKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
   HOSTCFLAGS_resolve_btfids += -g \
             -I$(srctree)/tools/include \
  @@ -84,7 +84,7 @@ $(BINARY_IN): fixdep FORCE prepare | $(OUTPUT)
   $(BINARY): $(BPFOBJ) $(SUBCMDOBJ) $(BINARY_IN)
          $(call msg,LINK,$@)
  -       $(Q)$(HOSTCC) $(BINARY_IN) $(KBUILD_HOSTLDFLAGS) -o $@ $(BPFOBJ) $(SUBCMDOBJ) $(LIBS)
  +       $(Q)$(CC) $(BINARY_IN) $(KBUILD_HOSTLDFLAGS) -o $@ $(BPFOBJ) $(SUBCMDOBJ) $(LIBS)
   clean_objects := $(wildcard $(OUTPUT)/*.o                \
                               $(OUTPUT)/.*.o.cmd           \
  diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
  index a38a3001527c..5cd193c04448 100644
  --- a/tools/testing/selftests/bpf/Makefile
  +++ b/tools/testing/selftests/bpf/Makefile
  @@ -171,7 +171,7 @@ INCLUDE_DIR := $(SCRATCH_DIR)/include
   BPFOBJ := $(BUILD_DIR)/libbpf/libbpf.a
   ifneq ($(CROSS_COMPILE),)
   HOST_BUILD_DIR         := $(BUILD_DIR)/host
  -HOST_SCRATCH_DIR       := $(OUTPUT)/host-tools
  +HOST_SCRATCH_DIR       := $(SCRATCH_DIR)
   HOST_INCLUDE_DIR       := $(HOST_SCRATCH_DIR)/include
   else
   HOST_BUILD_DIR         := $(BUILD_DIR)

This causes `resolve_btfids` to be compiled in the target endianess and gets
magically run provided that the hosts has `qemu-s390x-static` and a functional
binfmt_misc [2] on the host, but having this using host architecture per [1]
is likely better.

Here are steps to reproduce the issue on Ubuntu 23.10 and assuming
danobi/vmtest [3] is installed:

  XPLATFORM="s390x"
  XARCH="s390"
  # Set up repo for s390x
  cat <<EOF >> /etc/apt/sources.list.d/s390x.list
  deb [arch=s390x] http://ports.ubuntu.com/ubuntu-ports  mantic main restricted
  deb [arch=s390x] http://ports.ubuntu.com/ubuntu-ports  mantic-updates main restricted
  EOF
  sudo dpkg --add-architecture s390x
  
  apt install qemu-system-s390x qemu-user-static g{cc,++}-"${XARCH}-linux-gnu" {libelf-dev,libssl-dev,pkgconf}:s390x
  
  KBUILD_OUTPUT_DIR="/tmp/kbuild-${XPLATFORM}"
  mkdir "${KBUILD_OUTPUT_DIR}"
  cat tools/testing/selftests/bpf/config{,.vm,.${XPLATFORM}} > ${KBUILD_OUTPUT_DIR}/.config
  
  make ARCH="${XARCH}" CROSS_COMPILE="${XPLATFORM}-linux-gnu-" O="${KBUILD_OUTPUT_DIR}"  -j$((4 * $(nproc))) olddefconfig
  make ARCH="${XARCH}" CROSS_COMPILE="${XPLATFORM}-linux-gnu-" O="${KBUILD_OUTPUT_DIR}"  -j$((4 * $(nproc))) all
  
  # No need for a s390x ubuntu 23.10 rootfs, we only care about booting the kernel
  vmtest -k "${KBUILD_OUTPUT_DIR}/arch/s390/boot/bzImage" -a s390x "uname -m" | cat


For the chroot route, see [4].

[0] https://lore.kernel.org/linux-kernel/20240201155339.2b5936be@canb.auug.org.au/T/
[1] https://lore.kernel.org/bpf/cover.1706717857.git.vmalik@redhat.com/
[2] https://en.wikipedia.org/wiki/Binfmt_misc
[3] https://github.com/danobi/vmtest
[4] https://chantra.github.io/bpfcitools/bpf-cross-compile.html

Manu

> 
> === Changelog ===
> 
> Changes from v3:
> * Rebase to bpf-next and add missing annotation on new kfunc
> 
> Changes from v2:
> * Only WARN() for vmlinux kfuncs
> 
> Changes from v1:
> * Move WARN_ON() up a call level
> * Also return error when kfunc set is not properly tagged
> * Use BTF_KFUNCS_START/END instead of flags
> * Rename BTF_SET8_KFUNC to BTF_SET8_KFUNCS
> 
> Daniel Xu (3):
>   bpf: btf: Support flags for BTF_SET8 sets
>   bpf: btf: Add BTF_KFUNCS_START/END macro pair
>   bpf: treewide: Annotate BPF kfuncs in BTF
> 
>  Documentation/bpf/kfuncs.rst                  |  8 +++----
>  drivers/hid/bpf/hid_bpf_dispatch.c            |  8 +++----
>  fs/verity/measure.c                           |  4 ++--
>  include/linux/btf_ids.h                       | 21 +++++++++++++++----
>  kernel/bpf/btf.c                              |  8 +++++++
>  kernel/bpf/cpumask.c                          |  4 ++--
>  kernel/bpf/helpers.c                          |  8 +++----
>  kernel/bpf/map_iter.c                         |  4 ++--
>  kernel/cgroup/rstat.c                         |  4 ++--
>  kernel/trace/bpf_trace.c                      |  8 +++----
>  net/bpf/test_run.c                            |  8 +++----
>  net/core/filter.c                             | 20 +++++++++---------
>  net/core/xdp.c                                |  4 ++--
>  net/ipv4/bpf_tcp_ca.c                         |  4 ++--
>  net/ipv4/fou_bpf.c                            |  4 ++--
>  net/ipv4/tcp_bbr.c                            |  4 ++--
>  net/ipv4/tcp_cubic.c                          |  4 ++--
>  net/ipv4/tcp_dctcp.c                          |  4 ++--
>  net/netfilter/nf_conntrack_bpf.c              |  4 ++--
>  net/netfilter/nf_nat_bpf.c                    |  4 ++--
>  net/xfrm/xfrm_interface_bpf.c                 |  4 ++--
>  net/xfrm/xfrm_state_bpf.c                     |  4 ++--
>  .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  8 +++----
>  23 files changed, 87 insertions(+), 66 deletions(-)
> 
> -- 
> 2.42.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
