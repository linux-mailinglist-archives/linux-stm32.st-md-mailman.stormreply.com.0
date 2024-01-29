Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103D83FBB6
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 02:24:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2ECEC6A613;
	Mon, 29 Jan 2024 01:24:24 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA84C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 01:24:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9954E3200ABB;
 Sun, 28 Jan 2024 20:24:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 28 Jan 2024 20:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1706491459; x=1706577859; bh=UASoXhX4PTY3QDklhg97M
 HiJ1GxNYruI0l1hSTsM1IQ=; b=Sp/P9ZFJkQIEHfcvNH4pxlWQcJTVOu3NARJrb
 QU0vlJmpM4nohk3iDeQEo/Uuk1NtXdRe9TzUPuLVLZwihZ2nMpR1SaHdOFYdPeJr
 zyyOLJHWmQv7wFfiklp11U0lm+k97FGE2W734EFNtr2HA1l0VDW6mjxCvSRt+cv2
 Jz2l6Sncb1dytEyLi2GEvXGQ8aodcH4vddVYUfcqlyPdggq74hiSUGoZkM9NARAL
 grjLqJgJe/RfIVPH+Fxq0yr0PsDuKjMfahjqvFerrDmJPT3klD1YJQ4f8hx5H2my
 hiIvvxRm3KeWyQfKVuh8g6GeiEUxoxvfTxyklE1gB/WGbzKRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1706491459; x=1706577859; bh=UASoXhX4PTY3QDklhg97MHiJ1GxN
 YruI0l1hSTsM1IQ=; b=toSTS5fIeqME+j6fCgQl7sXWi2TbaNbgcEYAv/FUpQCi
 ojINcUtIFRCemYQFFUCw9KMt6lbUje5JxS9ppMq3UONrtbV910ynaSb71OoD+HR9
 MskHaANtEDpX/5ZHaX0tU+6v3twRjwEl6fh9aWg3iJaQzjt41KBNs7OnsV5nkZUf
 9Gf8uMy5g2kYfJaAOtwMMELWFbjTIAF79KrHS0lZ5rR+jWV+YW/iswh8WhA3oYi3
 iEncy2kWOFdpaGrtvFoMJ0nG9xynxVzhhwcsP7Sl9yD5qe/JLLH1f5gG1Q8jBSZK
 VLY7S7aDF71kp6q6/qfmcapQgHbU65dYB5oHy/DKQw==
X-ME-Sender: <xms:Qv62ZdjsQSYWbTlKTLSEqMzzeUVWsCelA_UpwRQPxO1pbHXMb9VtDw>
 <xme:Qv62ZSAE8nNVyjnQSVjZrXsWge5dcgOFoP5891x2RYn4LJanvbYpqiM9jdLBQJ1P_
 62DAc7xuFK7DVJxvA>
X-ME-Received: <xmr:Qv62ZdHZoFIBgCnLzmLD3S7ZxEXX2DyqstxMiOMW2vy6EYK23Jj0mlqAdYVy07CZeSgvbkqi47Kp8joEaorqp0d-f4OR9TxCKAtWAHu_Fqg1hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtfedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihu
 segugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpeffffegjeduheelgfdtudekie
 ejgfegheehjefgieejveevteeiveeukefgheekjeenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:Qv62ZSTwvQHw03v-B2f1Bae6pN4fJB-3Qs8pCTG6pZi9wB0IlqrCtg>
 <xmx:Qv62ZaxbEzm0olNmw8XT6u5Hgp2K4DFcOrRD_Mo1YqOS2_wuDmHRhA>
 <xmx:Qv62ZY4sEd0MomoUDEp5-KW2l923PFpKcPYCM2P57eJmietEO2dsGA>
 <xmx:Q_62Zfhc89QQ1-UiKEW_sidKxkm0BIiyi8TNBF-Dz_bCocdzYVhFcg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 20:24:17 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: linux-trace-kernel@vger.kernel.org, coreteam@netfilter.org,
 bpf@vger.kernel.org, linux-input@vger.kernel.org, cgroups@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 fsverity@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netfilter-devel@vger.kernel.org,
 alexei.starovoitov@gmail.com, olsajiri@gmail.com, quentin@isovalent.com,
 alan.maguire@oracle.com, memxor@gmail.com
Date: Sun, 28 Jan 2024 18:24:05 -0700
Message-ID: <cover.1706491398.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in .BTF_ids
	section
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

=== Description ===

This is a bpf-treewide change that annotates all kfuncs as such inside
.BTF_ids. This annotation eventually allows us to automatically generate
kfunc prototypes from bpftool.

We store this metadata inside a yet-unused flags field inside struct
btf_id_set8 (thanks Kumar!). pahole will be taught where to look.

More details about the full chain of events are available in commit 3's
description.

The accompanying pahole and bpftool changes can be viewed
here on these "frozen" branches [0][1].

[0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
[1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed

=== Changelog ===

Changes from v3:
* Rebase to bpf-next and add missing annotation on new kfunc

Changes from v2:
* Only WARN() for vmlinux kfuncs

Changes from v1:
* Move WARN_ON() up a call level
* Also return error when kfunc set is not properly tagged
* Use BTF_KFUNCS_START/END instead of flags
* Rename BTF_SET8_KFUNC to BTF_SET8_KFUNCS

Daniel Xu (3):
  bpf: btf: Support flags for BTF_SET8 sets
  bpf: btf: Add BTF_KFUNCS_START/END macro pair
  bpf: treewide: Annotate BPF kfuncs in BTF

 Documentation/bpf/kfuncs.rst                  |  8 +++----
 drivers/hid/bpf/hid_bpf_dispatch.c            |  8 +++----
 fs/verity/measure.c                           |  4 ++--
 include/linux/btf_ids.h                       | 21 +++++++++++++++----
 kernel/bpf/btf.c                              |  8 +++++++
 kernel/bpf/cpumask.c                          |  4 ++--
 kernel/bpf/helpers.c                          |  8 +++----
 kernel/bpf/map_iter.c                         |  4 ++--
 kernel/cgroup/rstat.c                         |  4 ++--
 kernel/trace/bpf_trace.c                      |  8 +++----
 net/bpf/test_run.c                            |  8 +++----
 net/core/filter.c                             | 20 +++++++++---------
 net/core/xdp.c                                |  4 ++--
 net/ipv4/bpf_tcp_ca.c                         |  4 ++--
 net/ipv4/fou_bpf.c                            |  4 ++--
 net/ipv4/tcp_bbr.c                            |  4 ++--
 net/ipv4/tcp_cubic.c                          |  4 ++--
 net/ipv4/tcp_dctcp.c                          |  4 ++--
 net/netfilter/nf_conntrack_bpf.c              |  4 ++--
 net/netfilter/nf_nat_bpf.c                    |  4 ++--
 net/xfrm/xfrm_interface_bpf.c                 |  4 ++--
 net/xfrm/xfrm_state_bpf.c                     |  4 ++--
 .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  8 +++----
 23 files changed, 87 insertions(+), 66 deletions(-)

-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
