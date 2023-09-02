Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF037904FE
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Sep 2023 06:41:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B86EC6A61D;
	Sat,  2 Sep 2023 04:41:17 +0000 (UTC)
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com
 [162.62.57.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28000C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 04:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693629668;
 bh=TB5AzkK7BN11nl5AAqPvegLlqHhbbgXPppq8dVRYyGk=;
 h=From:To:Cc:Subject:Date;
 b=nxlvie0mTV55LYVcYJ/Gmk8LRZfwJHGF6m+eeR52DrzTLIlpZGMqKOIaZyRxYYxCo
 LyOPeDv+A7MXPQ3vRRO10B+BQgMUoM4psX7L5AEleJ6g/Uv5thOg8gs59HN/esVI43
 FeGc84H/ykOkbW1TJohDEnuv7W2jf1BEGoQdDzuU=
Received: from rtoax.lan ([120.245.114.63])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id A4223C8B; Sat, 02 Sep 2023 12:41:02 +0800
X-QQ-mid: xmsmtpt1693629662tcmxrwzup
Message-ID: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
X-QQ-XMAILINFO: NPwOoMPVnumVrk0WlvgQ5/KlGSuOPPLb/zmXV3pzh/F3IfZonwXumnrpV9lLkg
 7o6VwApLYu4nGrGgJY1tEkoTBdrZhhzxqfnxMa6Emkk7yY3xHIw7Ggrwrk5sj6dMdcMwBOOoTK9l
 luJ3Dr/NyTXk/UrqSKzyWBhWQ391LtIERaJ1eXe2Ws8Zd8VyxwR54VWfkIxjxF3lni1Q588FuvwD
 qu4fU4Z0nSW4mKndGMXvmi9x28DkYh2Bk5OhEkcTv5IFYeug7BP4gtnP3PLqQ62U/tmfnQFCvP41
 XLGEHnyiVz28fut8LCXOHnuBKWUQv++vB4g9RzBzSRCMwiDX5YrxMHKN7zmUajqN9VT5Cg0S5Y5h
 Ep1zeL13fJrRRB+JyC6877ky7yuL4fHTLSMao3qC6Vh9UhiXHLb25+S8UQzhXGgYVBmorgSeZSOi
 JTzWR8UnzVImO8kjHghviILQ0iu1kQagqsCnMlA5xWRtu+0IG2l+KU3W898/wlAN5n/2bu+uBFs3
 lGsY8gspUVIjmsUupGqXK19A4t7LiXqTnic+iS3ISE+L6Nojm9isJ7gkienl+O9b5Di2Qb7UDsN6
 IerJz6Qbaj80eRtVEnH1l4C3qSaW4E3xamBF8yl1BtT+NObRJMepXBAt2KbvoAKfyoL9dSviyTTt
 hQ3Glsi1vAfydQjdhAhxOUzLbCgubquVQxzG9dVhaTgXlxvWk3bQYgGB5de1qNCRBihYKCSXUFDV
 1qB4q9u3/gGvkJM5GUQH77lXomx/MYE80Gv4JKTQ5FeJbbP3OjU+Rm0ppf1jgwCCCh43rAxwLKCm
 LCSRmnnil4DGk1oVk3RqAq2NT9axBFaA3FjnlV7fRcirjsWLQKCaNqdjaCRtSK5Rbuz6Dx2InhJn
 f6tnLIVH4ZK9kaFd6hbtMguPZ1HzBsdKW1tfx+sY4aTu/jLTbIGKESCZZxoUEacjXmmmd4NL3FgA
 ynugw/E2d48JFUlSi65uAWvgfYf/F+
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com, andrii@kernel.org, daniel@iogearbox.net, sdf@google.com
Date: Sat,  2 Sep 2023 12:40:17 +0800
X-OQ-MSGID: <20230902044040.137804-1-rtoax@foxmail.com>
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
