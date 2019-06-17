Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820D48D77
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 21:06:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22C59CE8D00
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 19:06:25 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57931CE858B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 19:06:24 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HJ3dlE006806;
 Mon, 17 Jun 2019 19:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2018-07-02; bh=OaHbeR0lOY/DEBGaqTG6p1kztv8w3JP2A32htJKCwpk=;
 b=2mPajXvU+J9LkdGoyF0fTtoih1vrC3SprPxHN7uv4HsbySfuNvTMb6s/CfDyjexfzd6s
 EvXOHmymsiQ1GEXA/73SDyJeimba5snAnfo9eFEsUjXFkucunwSY7O4JLxgbLUP3PXT3
 kcUMM6OyxqFWbcHgR/qcUrA3IhIArNdPZfGJejszE0f7Nfd8Gha1erlHdEk6OU9UFKRo
 cshsbDlc09VoJ/UJto5SiqRhse8e6NPhgUvRFKiOZM9L7oImbTzYYuKLjUiH2NxKRWoh
 RIEkELcWKDeYtCxmmkpxL9INKUxeYfgKDaBKdXsyJW8cdIJ8kY6Jtx/PE2IJeEMN1yEo Mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t4saq86qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 19:06:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HJ4PY0118043;
 Mon, 17 Jun 2019 19:06:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t5mgbh6nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 19:06:16 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HJ6ECm024547;
 Mon, 17 Jun 2019 19:06:14 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 12:06:13 -0700
Date: Mon, 17 Jun 2019 22:06:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lee Jones <lee.jones@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190617190605.GA21332@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170169
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170169
Cc: Amelie Delaunay <amelie.delaunay@st.com>, kernel-janitors@vger.kernel.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mfd: stmfx: Fix an endian bug in
	stmfx_irq_handler()
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

It's not okay to cast a "u32 *" to "unsigned long *" when you are
doing a for_each_set_bit() loop because that will break on big
endian systems.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Fixes: 386145601b82 ("mfd: stmfx: Uninitialized variable in stmfx_irq_handler()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mfd/stmfx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 7c419c078688..857991cb3cbb 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -204,6 +204,7 @@ static struct irq_chip stmfx_irq_chip = {
 static irqreturn_t stmfx_irq_handler(int irq, void *data)
 {
 	struct stmfx *stmfx = data;
+	unsigned long bits;
 	u32 pending, ack;
 	int n, ret;
 
@@ -222,7 +223,8 @@ static irqreturn_t stmfx_irq_handler(int irq, void *data)
 			return IRQ_NONE;
 	}
 
-	for_each_set_bit(n, (unsigned long *)&pending, STMFX_REG_IRQ_SRC_MAX)
+	bits = pending;
+	for_each_set_bit(n, &bits, STMFX_REG_IRQ_SRC_MAX)
 		handle_nested_irq(irq_find_mapping(stmfx->irq_domain, n));
 
 	return IRQ_HANDLED;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
