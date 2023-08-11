Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF2784733
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CDBBC6C85A;
	Tue, 22 Aug 2023 16:25:21 +0000 (UTC)
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com
 [203.205.221.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DD97C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1691712115;
 bh=Dw7XtY4SevyEQWP/R3km8lwVfji8O5oF8nQ61Ju8lII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=wQ/w2OYRb55uo7a0KjMWAjzCgsK+2zcXXuCuCzkaLtNX5m9w7OiH2MNl9DJo0cLjH
 Mo0+r6DK/56pO5O1tpUpcMtGY/r4GlgiHstjudm6Upwg5ydpk2ltlRq0y/w8wZfcN2
 YieSgV2goVXOyMRYlE64Tjel3IjFHfAvjRY9WFPE=
Received: from localhost.localdomain ([39.156.73.12])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id 5C93239; Fri, 11 Aug 2023 08:01:28 +0800
X-QQ-mid: xmsmtpt1691712088tsfdmiii9
Message-ID: <tencent_9C20DA1AB80A0564315EF2A91CBF7A8C260A@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYS7ayxzI94vsOZqKVqzudryzUCgm2P/WZtV5OQZSk4thPDk4eEea
 aOAs2ToOp0ryzFXZFmC5//FrsUCvlph1kCqtBy17GTWj5v06gIDvPYoQPUAm3eXXgwY+8YZcn7wH
 nZ5Bv033LLS2gs6ZbFTeZOMZbGPBooqpR1kVEX8oUbEGLAQqFDyrVgCdphpUsnGtDFCjH1G9RKYd
 JQIYkqSvxZPkF0QUpRYPQjsJTW+WESgkevpos0ZrUv1JE2pBY+LufkvpE7iDJRFLh+uslBk1H+Xc
 vM3p+r4h/oz9x+mDl2UcnjveZnz//TyMkAx2s9tuECDg0I9xxr8htuMrnBWBvG2itJOIgU1nNx5a
 ihlL0pc2XKwPjmHyOj8rHX3E2rNLbpYYhoceF94vtR8XaoY+At/u1fQEV3OiykDtZg7ZBTXeLbWN
 SCHBBCDoBTct28+Eq4HrXH9o1hVl8h5MGy7NSzZcuv6q5RwdpeQ0uWHW/AIcuCw9Tto+w/lrlu+b
 EadIcOJW7lATigJ8z7ITNUkSQeWtiuYTXmgkOXXW9+gajSAwIUdIfiavia2zLSCJQE2eadhn+tG0
 Pbzy5+KuLpcV1MCGF1GOxkHvf0YwUUtY5caEQpeHrupbrQBPm6GQAOTzNppjpGQSBH/WaDyNopv4
 OaFd1ALlwVZhbbuaSXRa/4/TYldXvISgNPCvc4OgWUx2e0/rR6wh7w0cOHYxNP9HdKrfTXjphFH7
 psBmTEBCjRRMO4RxHMeZ+5CKTkwmVhO65hHeSuAutrUujDm73PERC3mmza6exk2f/z9rt4v4EKIr
 T2K8MkaXdR1hX1ezbY8mT34Sazzt0qGeXOL7xj5DU7iRQepKbj+BahIhiHvrzItdlrqY9NYvnqkG
 CvPQCxjmB6TOSOp09g5b7xGoNFeB3PQuQr7p+pGjdx6elLQW7QCaEwTN0B37dkjt/i+ZWex7/RdC
 FvUpfn5YT7dHIdykWUVks76hC5OA2M4AnIJDLTxXWrMmfNYz7KOA+QtVZDcRaQ
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Rong Tao <rtoax@foxmail.com>
To: sdf@google.com
Date: Fri, 11 Aug 2023 08:01:28 +0800
X-OQ-MSGID: <20230811000128.298569-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <ZNUnxJ26/4QfvoC+@google.com>
References: <ZNUnxJ26/4QfvoC+@google.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: yonghong.song@linux.dev, chantr4@gmail.com, ast@kernel.org, song@kernel.org,
 rongtao@cestc.cn, linux-kselftest@vger.kernel.org, deso@posteo.net,
 rtoax@foxmail.com, xukuohai@huawei.com, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, iii@linux.ibm.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 jolsa@kernel.org, zwisler@google.com, rostedt@goodmis.org, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next] selftests/bpf: trace_helpers.c:
	optimize kallsyms cache
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

Thanks for your advise, you are right, i just submit v2 [0].

I just found that, because of the modified patch, your email address was not
obtained through scripts/get_maintainer.pl, so the v2 [0] email was not sent
to you, sorry.

Rong Tao,
Good day.

[0] v2: https://lore.kernel.org/lkml/tencent_B655EE5E5D463110D70CD2846AB3262EED09@qq.com/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
