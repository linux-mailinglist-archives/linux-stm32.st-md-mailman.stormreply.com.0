Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAD3F7485
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Aug 2021 13:47:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80BA9C57B60;
	Wed, 25 Aug 2021 11:47:56 +0000 (UTC)
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3662FC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Aug 2021 11:21:57 +0000 (UTC)
Received: from BC-Mail-Ex20.internal.baidu.com (unknown [172.31.51.14])
 by Forcepoint Email with ESMTPS id DD899E7C4B9B76EDE2D1;
 Wed, 25 Aug 2021 19:21:54 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex20.internal.baidu.com (172.31.51.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 25 Aug 2021 19:21:54 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 25 Aug 2021 19:21:54 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <nicolas.toromanoff@st.com>
Date: Wed, 25 Aug 2021 19:21:45 +0800
Message-ID: <20210825112147.2669-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Wed, 25 Aug 2021 11:47:54 +0000
Cc: Cai Huoqing <caihuoqing@baidu.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/2] crypto: stm32 - Add support of
	COMPILE_TEST
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

it's helpful for complie test in other platform(e.g.X86

Cai Huoqing (2):
  crypto: stm32 - Add support of COMPILE_TEST
  crypto: stm32 - open the configuration for COMPILE_TEST

 drivers/crypto/Makefile      | 2 +-
 drivers/crypto/stm32/Kconfig | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
