Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEDD79234A
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Sep 2023 16:06:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C103C6B454;
	Tue,  5 Sep 2023 14:06:13 +0000 (UTC)
Received: from out203-205-251-80.mail.qq.com (out203-205-251-80.mail.qq.com
 [203.205.251.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48AB9C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693922770;
 bh=j++hW7hBYNWYYglVpF7psTQmZPPLAOIfD9k/RR4Upqo=;
 h=From:To:Cc:Subject:Date;
 b=gpTwVQy4Gk3Esy4VzxUcxyz7X3QY7Vy0y8q39mp7T547lKh6HpV76ncqCf7r2+Q9Y
 hJ1e7c3rZAvNfajV/zkKaHRD2rXwQ7owOOQqW7v/tu5PyTLRXBU8kcLXpDyZ8hwCGx
 bghhzvEAjmxPiRMOxeejFAfnEU28wC9H0mDPIMdQ=
Received: from rtoax.lan ([120.245.114.157])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id 12C80033; Tue, 05 Sep 2023 22:04:44 +0800
X-QQ-mid: xmsmtpt1693922684t6nawmh8y
Message-ID: <tencent_F04BD6C8A5A70AD82BCCE820E2B2419CD006@qq.com>
X-QQ-XMAILINFO: N+tZcXNNUKPOwN8ITHEbltp5Kv0oYE5xRtAsesoPEBX00pQKxTUQdryVDwTyG6
 wYKJ3XGWaTwkGxuIAbuFhCQvhBxCwznGoRZzqC3TPkj394XYog3SL7i4MRjC0gPer8KYNJRAf1tU
 uiHLwIIq6PnJ6cyHp6wocXi1uZrKaHm96TeRVhke9KhluVkwfITTElINqGvABHZyl0qnsnCxv8JO
 b7OI7c5sxnwMGnmumY6+TEnRcNKYwXEG6qsoc30uYDKx78kgUFORWRV9Ozuzi3dt9NAS5sZMD6DK
 1DLFJGRZC28DbC9Vv2FD1i1eMMsehbH/zwqgk7JI4c30U6ZouPguqHtZzH6fTEUe/LS8Y2zZMVLy
 P0yajztAvNdqelFBG/1Z8vSEOa7mQ0fqmF5UeQQTzF1r65ecIAelqKNnvO/u+EEXNouz+V/K7V7I
 OqFaQor91AREutPIBgwzGsd2gRIKThj+YTHm57r5laQxP5SUAkSN1c65mR0mNe7GKpFlMkQtQpr0
 +oxdgRozTckXGAhKtUuDwndd7gb7tLVYBQsuvPfneY70+0StawrgQX0iKUF42AiVZfZ+rUQJ4iTM
 XjMeYW7rn9u2w+pk1nDMp9DyU2aF8oGZHRcgXTE5yk1wL3XzbBWdN9sZhJyOhoEhwfy2VxRTZ/jR
 zefo+lun4sOikIPbr2IhB7gAcfKYYZE+O+er7KNuGuF4UmYzDO/VrIOte2UhDB4X3rgyOUxuH+20
 I6DvITNEriHaOrtXkfqJDsTKLyZu3XYZFOQJmohCVCrz9MkwgrXbxJfRmh14iAcKnOVL/3R4P3qr
 fwK7t3YqYbUKd900F6VAuyG4zKQLyBQSKsb8QMH55++/zu9IiSWDK6OGrFdjgwh8xJHDKZwU1f2M
 VJU/mYok5RxTEqp1yUbmEAwQTW7pmf5r/RXT30eQEcCNBpDS4hdLqsiRBjSE/60GnPN7o7od5qSU
 IQ+y7StIzTGMIRZEItsyLq65RZqSIu35JcLgT2tZ4oEc+vE9AFc7Mebs5asUE5
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com, andrii@kernel.org, daniel@iogearbox.net, sdf@google.com
Date: Tue,  5 Sep 2023 22:04:17 +0800
X-OQ-MSGID: <cover.1693922135.git.rongtao@cestc.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Hao Luo <haoluo@google.com>,
 Mykola Lysenko <mykolal@fb.com>, open list <linux-kernel@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Rong Tao <rongtao@cestc.cn>,
 Yonghong Song <yonghong.song@linux.dev>,
 "open list:BPF \[GENERAL\] Safe Dynamic Programs and Tools"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH bpf-next v11 0/2] selftests/bpf: Optimize
	kallsyms cache
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

From: Rong Tao <rongtao@cestc.cn>

We need to optimize the kallsyms cache, including optimizations for the
number of symbols limit, and, some test cases add new kernel symbols
(such as testmods) and we need to refresh kallsyms (reload or refresh).

Rong Tao (2):
  selftests/bpf: trace_helpers.c: optimize kallsyms cache
  selftests/bpf: trace_helpers.c: Add a global ksyms initialization
    mutex

 samples/bpf/Makefile                          |   4 +
 .../selftests/bpf/prog_tests/fill_link_info.c |   2 +-
 .../prog_tests/kprobe_multi_testmod_test.c    |  20 ++-
 tools/testing/selftests/bpf/trace_helpers.c   | 136 +++++++++++++-----
 tools/testing/selftests/bpf/trace_helpers.h   |   9 +-
 5 files changed, 126 insertions(+), 45 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
