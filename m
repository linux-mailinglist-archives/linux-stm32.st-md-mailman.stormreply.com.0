Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C543181D867
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Dec 2023 09:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C233C6C83D;
	Sun, 24 Dec 2023 08:52:38 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFC44C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Dec 2023 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1703407953; x=1704012753; i=markus.elfring@web.de;
 bh=J9AFeaTjFODuXC5t8p5hISXXnz0jr5F1tAmJ6A9HIGs=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
 b=Fa1v4kYUxSqv14A0oAQxXZCYXk6urYxYo20TODS9WM4UOtT7nT27ZLodhs8sikXh
 eS0Qn4v3zusco8tMXEM2Tg200p+MmErQ3ogtjQJbZVhruPJRSllytA/Lx6r0GJTUt
 guS9jXQTz9r0ZahW+M0vz6Vr4qj/DYaEq2HGdMoN+CibrX3FKcLVDaOEJAc7tUV0j
 YnJVSHT7aWtpxt3ouQ88Mp9obbSxr22yXQDfYLxw0O0dWfn3sVY11oo8AUsh/V5T2
 DOCMqW1oaub1IxsZOyubj4lhWqqNZ1Ho/Xt0BZ4qdm9vyqkISp2AqW6XuLBjQYu4u
 2FuzL3WGVSJeZ0YbEQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Ma0PY-1rkuIf2nqe-00WMuB; Sun, 24
 Dec 2023 09:52:33 +0100
Message-ID: <89708781-f34a-47af-8aab-025136507da0@web.de>
Date: Sun, 24 Dec 2023 09:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
X-Provags-ID: V03:K1:B9yYikbLk2Rc1omAIk7V1I4TYkgY3SUAvNpijGraxc4PWGwWolc
 TDonYPQmNJkx+EONlIBJ5/9iuPRSHNUupsbJ31paWQp3ZdY25VE38Or3BDMAJSfyqmeKZvC
 jaxSusEoTz7PAmx62x5SHyQ2eHCnhFhqNmbuCf5ROQJRglUKPwcUbyopWjXGk685cbSS+9E
 V0xvNAC3t01QCbVdjiDjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cPzjS5EdR30=;8kzncu32jgClyJqfnSC/jFyGbPI
 chw/MI99G76gULkuV2Sgp0TBFmIG6ucPK7HZw62RNlHS8p0GDERWe3GXDl01mncMkykxjkfDR
 xuoMWgd+x1uIbA47j84raF36RnLtSLZ6lBT/LOUOSZVzIBOCOhck5N73mVJkA7jJFYJ15b0eA
 IcipaI0dPXU4NJOYDTM/NCmfWfc27yK7NEewAmCPMdViZc/ts7byidJI7Bgl8l9i2TCstjpWC
 Ew064FDTEku5YNzMvCLwvk8kREzvDt69+95Gegacaiv+aQbR68wNlSEDBwe9HhOPbnpJbvrwm
 EZDpk95XROIP7TZ9i3gTRtIByw9VbJg7EbGwAv6+Ns3GZkEzYjyJOvc2DYKNVuBxnXuvEa4o1
 SCGC8HYRrR+N2MHh4Joc47kAr4YzGajea56ls84e3yN2jvTSqrWUB4Ss58wdmGy50bik0p+0E
 1BWnjNKG85DGHET2Mq+ZS/Y3a+O1tyV+xHpsSYFZc+leMtj3w7GPJ1JFiW/Qi/stv5V6zmN7g
 O/U30JpBaq3CGNAPBPStlsGX9tJMKn2FgNmF9EGLnYThSKFJG5G5v8gkG7f/sdUDgf/Y8yiIl
 FjHff+Otg8P2jkKDyDcRyvPLgb134darF2BJ/O7LFOL3w15kDOwMAfNZ5DWyGLXJod7INyV+0
 gNW/Mqvkk8xTe3YrSx8RVlmkstg2Cn7J9Ik8DfUw177MsbiQMSsjwHaGr7GNyMspGZ/0Y/dKz
 E55S2gyJ5+KFCR6ti+3+TQ3SDJj88/0edzbk4UI7oWIE7aT/HGD/inPr6JVOhpN2fYRXjNdJJ
 n6KzJlHj5HuySKuC4iKk3EsxCkm09Jo8rrplq+NcOkRMPSgB5LonlT/hQxKc9lYJOLsRzB5tj
 dPDqEhcozv1b+sacdz10EzKRWo6XnK4JqC2uCeIh2QtAvQGkGf79A4LHrnZctriXqa3hjMI9K
 GovnztI+5W68AwMDxI+eqz3hqFk=
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Linux-stm32] [PATCH] clk: stm32f4: One function call less in
 stm32f4_rcc_init() after error detection
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Dec 2023 09:40:10 +0100

The kfree() function was called in one case by the
stm32f4_rcc_init() function during error handling
even if the passed variable contained a null pointer.
This issue was detected by using the Coccinelle software.

Thus use another label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-stm32f4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 07c13ebe327d..c7690a1594eb 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1714,7 +1714,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	clks = kmalloc_array(data->gates_num + stm32fx_end_primary_clk,
 			sizeof(*clks), GFP_KERNEL);
 	if (!clks)
-		goto fail;
+		goto unmap_io;

 	stm32f4_gate_map = data->gates_map;

@@ -1897,6 +1897,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	return;
 fail:
 	kfree(clks);
+unmap_io:
 	iounmap(base);
 }
 CLK_OF_DECLARE_DRIVER(stm32f42xx_rcc, "st,stm32f42xx-rcc", stm32f4_rcc_init);
--
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
