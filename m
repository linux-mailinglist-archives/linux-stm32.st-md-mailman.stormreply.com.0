Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C618826106
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Jan 2024 19:24:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1598C6B45B;
	Sat,  6 Jan 2024 18:24:51 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9EB5C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Jan 2024 18:24:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BEEB15C01F7;
 Sat,  6 Jan 2024 13:24:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 06 Jan 2024 13:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm1; t=1704565489; x=1704651889; bh=O+QqJr2WAb6rnS5d3f3K/
 DUa8bao3pdF0ZTmvmSXi54=; b=nSlxfYqtTJQDcbNuLTrQgszS9JWQG78owNAi+
 zSEhkctan19C4FEG6xx31H7/uqLhr7cesA1k19u3yPWoTqEsjFQ9yXkYWzOwcrCc
 uVFm073ba2P4po8CIj0KsQmKiUvyewqrtgGGHYuCsQh9sG9wTVHadAUo0quCq9nh
 3wn4b3d1hbj+B/ZBZzqNQciP6TjHgoc98zJcDMj167R+hteCx5QxTdQFWmXVzzZW
 dLZHp2yX3SB79f2KkARUikb1eP9u23YNh795fdJ0UznpK3VR5tdEnA4s15gPY+yc
 m8kLTyYiJGEIqc1JEboSKWqEtD7xjep48oIUYT69ow17Gai6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1704565489; x=1704651889; bh=O+QqJr2WAb6rnS5d3f3K/DUa8bao
 3pdF0ZTmvmSXi54=; b=b3+3KpJVeWQPqqPw2/XyIgSWVprhEDWFog7zIhj7juCB
 2fghtEDXjtChsmjRYm5But8IKubV1CNa4oc4t8RnFO9oYn0LRNPBXCZSj+uBMyoS
 hqCbZqfAaWnezgz2I9YNwPlBKGmW+OwMM5TKxf+m1k5XACoJwnYaulFkWJXWIeuC
 G4wTyt1bBYVR3EFQPep8tJMmwO2Z8w/GPAloXq3sTltOn9ht5D9dBpVImQ3kjoaF
 Kl0wD++fiJfxAfJraal4lPmjZxrlq5azZ6HzjJk0lPs0xKwIWbnwmcNllJA6r0i8
 Bziwb2eIGshtU8+n9i4yL+sn1ttsvey9hwKh4kj2eQ==
X-ME-Sender: <xms:8JqZZTa2LWzgZ0-GmgqS5LmLiABXTJV-q6m5pw2KEf52kA-_v2wfMA>
 <xme:8JqZZSY16TYAWdOZIuP8yKWF5XRgyCIaZj9hCtazJgvb_WXDJT9OoLmN_FIlP23Tb
 sL0h3wKj1DmLsm58g>
X-ME-Received: <xmr:8JqZZV8ddNHA1F0_QGF1cpRCX1fLuMSzgKqs_Fg3sXfaUgOpYFT_S3HHautwyc1OmhIwEyCsPi3RRo61vZxpwY8y-vSDxy2GkEZ98QEvFqVpPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdehuddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhephf
 fvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepffffgeejudehlefgtdduke
 eijefggeehheejgfeijeevveetieevueekgfehkeejnecuffhomhgrihhnpehgihhthhhu
 sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:8JqZZZpHSzujnehtNM-9w6SM6ebZxdJiLRzNQZcPYUXvIr1FXoFm8Q>
 <xmx:8JqZZeqcnauyVxfA1Rp6P8hO1PAbhin9VwCYuUjW_KX7IU7bSpqbDg>
 <xmx:8JqZZfSntMFC9PDiV8fngNBCBp68lp9CgFnySiCgnfTcNGT64YxhQQ>
 <xmx:8ZqZZSZbzVDin2kRmp_SLX1xW7XThP5VlZBJyX2zJfv-05ftzvGpwQ>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jan 2024 13:24:47 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: linux-input@vger.kernel.org, coreteam@netfilter.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, fsverity@lists.linux.dev,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, cgroups@vger.kernel.org,
 alexei.starovoitov@gmail.com, olsajiri@gmail.com, quentin@isovalent.com,
 alan.maguire@oracle.com, memxor@gmail.com
Date: Sat,  6 Jan 2024 11:24:07 -0700
Message-ID: <cover.1704565248.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH bpf-next v3 0/3] Annotate kfuncs in .BTF_ids
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

The accompanying pahole changes (still needs some cleanup) can be viewed
here on this "frozen" branch [0].

[0]: https://github.com/danobi/pahole/tree/kfunc_btf-mailed

=== Changelog ===

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
 net/core/filter.c                             | 16 +++++++-------
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
 22 files changed, 81 insertions(+), 60 deletions(-)

-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
