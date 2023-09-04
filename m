Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA64790F70
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 03:02:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B4AC6B44F;
	Mon,  4 Sep 2023 01:02:01 +0000 (UTC)
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A28C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 01:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693789312;
 bh=TB5AzkK7BN11nl5AAqPvegLlqHhbbgXPppq8dVRYyGk=;
 h=From:To:Cc:Subject:Date;
 b=H/frfDkLoDJ22Ssoz/+NRxF4uUDmRvT6dmbMOYOtDAs3kKJ4HMAbJV7+KcdD7Osc3
 6QW+WFFS6/bjimFIPN3zlpULOZUPtACQ1vyW0ZOT9xq3skU+blHKHeIV4QnX+fK0FL
 gbJ2J6Y/1RifMMk0uoetX23BAahF/Z3JvYL2FuQ8=
Received: from RT-NUC.. ([39.156.73.12])
 by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
 id 6E8B05F; Mon, 04 Sep 2023 09:01:46 +0800
X-QQ-mid: xmsmtpt1693789306t6uqnk9ls
Message-ID: <tencent_8898BD228E12207A1A1408E167C15C86AB0A@qq.com>
X-QQ-XMAILINFO: OZsapEVPoiO6QpYiUEonvb5tVEG3ziOcQU89e5g17iOLxmlH/jeJMynwsFCWL5
 +QX7n8L4bIZHqCdtCxK3KPd024ZwMQB7fI8Gmd+f3VRNSab2yi59MvAij/GnwQ9tvVAc5eHLSZxi
 gAGbTmi9p8OIbDTgTBWMZ4vX1gRT4UDe+IfUzzLWizarcHfsHVOnhlicgfmBAPgdO25ZzRquq4xJ
 hpTscWhQT16Qa5bnu107g6ozuN/GfYz37ld8M1CmCssaEiLuSyW0grFat2FbPCimccF5BNujElKa
 /kqBqYrRBBLbEfX5LMDTst0LIzvGLdAYVwblxP7BXAbNRvT0vwQMXaARYnW+VeuwlSZF3c52MCkq
 08Yg5OiGKQqahrcIU6nnV6X+aDTG+0gXfLzwx12ZmLZ2D7n68F9dvZ/KogPr1DjJ+mZGpxRieDpu
 E/B1vBaM7+I5XPPKFhtGIW4RbHOqxknUQablIRW48LQr+zmJ5UCGNL4rH2v4yx8R42cVwbsWBcZQ
 mUA6/WeASZl1qVj0Px7Foq/uS+PTdIAqLTsKUyFsAVYpT9DCmHdOz4HzL/cag36mVepRH8K/P4d7
 CLs+KET//xzq2F4AcY9FQ+QMrbBakpx0h2vQFLWhB/K9om0dyxRaFnLS/+TZgl5uUZsCCQWcoHjL
 eWwT/N23Z9LuOfWApXWPt64DNVMGdbVhD/wAFcbyyEI/ySYXs9UOfMKzDqd7b53wvtpbA8fn7MME
 EejKAxI/DY1NXBbJV/PpdRwaKTWcuEFZE26NlJ4iRnMOg9aPri4E2GUqEz+9Pw1SXTnTi4IOvleB
 YljKS8+I/ATs1dLH9eNugFpDB/sknp3Tex1zVsSXUPbxgLxeWClJsv22YtYujqwOoLMnWqyokc5T
 jjr60J0D155quUhPUvCR6VQuHhj+Y9cWtgX/5fmqERFNebqm9jQxhA9kKQssfM8hgunelZ2IWSS+
 CxOyqi0cWymQxNcRSj/msou3f39u7uZwXgselfXIo=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com, andrii@kernel.org, daniel@iogearbox.net, sdf@google.com
Date: Mon,  4 Sep 2023 09:01:19 +0800
X-OQ-MSGID: <cover.1693788910.git.rongtao@cestc.cn>
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
Subject: [Linux-stm32] [PATCH bpf-next v10 0/2] selftests/bpf: Optimize
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
 .../selftests/bpf/prog_tests/fill_link_info.c |   9 +-
 .../prog_tests/kprobe_multi_testmod_test.c    |  24 ++-
 tools/testing/selftests/bpf/trace_helpers.c   | 141 +++++++++++++-----
 tools/testing/selftests/bpf/trace_helpers.h   |  10 +-
 5 files changed, 141 insertions(+), 47 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
