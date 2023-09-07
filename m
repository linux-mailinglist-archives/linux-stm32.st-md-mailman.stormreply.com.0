Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6D796EB8
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Sep 2023 04:00:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1808DC6B468;
	Thu,  7 Sep 2023 02:00:04 +0000 (UTC)
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com
 [162.62.57.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4479C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Sep 2023 02:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1694051989;
 bh=nq+60wHAJ2wJHOUYum8hucxDGb9mfXG5LmjcPS0ZQiw=;
 h=From:To:Cc:Subject:Date;
 b=pAq9/bzyWDpnDk5lchNWWr75HUzuiAv36CUwIpsfsiFTFLfJpLAjQv0t/+feAf69V
 +onwmVAeXDaTv5x12L5N6cbz1P71SMk2ZB9wG3xAq+jQefyPG8Kfd6HJePcjmFZFh5
 OOIzG5Iq/5MZ+GKMW8VVqKJFiqfNDYAWjlUrQSfw=
Received: from RT-NUC.. ([39.156.73.12])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id EEB27808; Thu, 07 Sep 2023 09:59:43 +0800
X-QQ-mid: xmsmtpt1694051983tn9019r1q
Message-ID: <tencent_FA47B711AB0DEC843EB3362E6355505ED509@qq.com>
X-QQ-XMAILINFO: NSObNE1Kae7Zzzod1N7QKTYip8Xoa7hH7x1+fzHTul/lt2xBwVTotcqQC+/02Y
 yQbCRw9vKFLyVqahY6Dq/PhRZaSZxQVOvhKhPU+acOJJJEudhyI6upQWh6Nlq3fk1OKDSY7lfgLR
 6fO9c8NlcGNNiSn8bO8BzcUBd5LnnPxE/ilNYNInTlHXpH2F4ClZbHjLrl7qpVrO4Uc84H8RblEs
 fIBh2K97YaAOYHlloU+abUBhbuLRZl2CYQmGjRH+l7ffz8X1OsgGAo5xnSJYrsfx3Js33xNrV2GH
 IdB65Z0OiAZl4mNOnuiO707r6nJVanfR0sV4/eanf73KVsDZF1ffQfuWA3M0EgqoVZdBOqg9QA4t
 gxZv7Gx4IzpURCxZKRx8Bqv3rQBBoCMtGtFHjLht2Pcbuhxon4vTp7kHCXiM7V3TCkqpZaMVVw/w
 O1otMUlk3pZFkaJ7DveudMBsS/PWpN7ITVaWopYrvveyRSwQLyLXlNicxM8ik4IS64nN76p5obPi
 h6z2a75Rzb1zToUFJOLVi5yZMgZjjMTDvOlUbvR5Ayp99MbI209gjeAdN1ra+N1iHhijxVZNyWDj
 R3omh2juneK3We6XP5gSYEHROkvzvgqPYrNNS5vzEBV80kD7W75ukR/a+LWaYwaKAmwcW2QwcczG
 WJTbFr34c2zFFAi24//INCErAn7hfZhpY/tODV6Z3eROD2JA7X9XplLMOPi1Sbz9LEY70Mu0/sqd
 k1Q1JalGo1N6z7dK576Awtn4Ui/VWwznsD3LSSM3LrXtwueRNfF2VeTN5gIgE4d1fKTT98ty0ME7
 I8sRrSrtvQPTrk0lLQTfK5IW6LOXhgCEQk6K4JL78yzPAKrq7sbWzpwW7h04/UvRSmMqwlAHZGYf
 6JIwsTbrtbPlSaqhuoUnpyQTjY/hOVgXrWHJb20LHCZu1KEnnhgAspm7BkG3hXzBzNuBawy6c5L2
 grIQVzeQeH4zO5MJW4na7hRkE8Sr/Vvl+Skdgta64=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com,
	andrii@kernel.org,
	daniel@iogearbox.net
Date: Thu,  7 Sep 2023 09:59:12 +0800
X-OQ-MSGID: <cover.1694051654.git.rongtao@cestc.cn>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stanislav Fomichev <sdf@google.com>
Subject: [Linux-stm32] [PATCH bpf-next v12 0/2] selftests/bpf: Optimize
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
 tools/testing/selftests/bpf/trace_helpers.c   | 134 +++++++++++++-----
 tools/testing/selftests/bpf/trace_helpers.h   |   8 +-
 5 files changed, 122 insertions(+), 46 deletions(-)

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
