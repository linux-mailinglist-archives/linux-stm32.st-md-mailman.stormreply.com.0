Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627A5FD486
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 08:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0321CC640FF;
	Thu, 13 Oct 2022 06:13:12 +0000 (UTC)
Received: from smtp.cesky-hosting.cz (smtp.cesky-hosting.cz [91.239.200.238])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9F44C640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 16:11:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at smtp.cesky-hosting.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elrest.cz;
 s=rampa2-202208; t=1665591105;
 bh=8s1G8rPHpjsGwXW21PDH+LArXdE+rGVYILQiiIoRimM=;
 h=From:To:Cc:Subject:Date:From;
 b=MO4Ux6aFNuqJav5oplzpooNe6j5JMfeKDGxAPDlfqb59IpGFsO+wgUNJMsA1MGClE
 AqWUNlKNb5SbUr5n2TvVTwfLKrVTCU+C0IvoLlQD8WxcwblZiO9Bd+rCXi6JMku5Jf
 BHFzbceVjSDjVc3RpbfU19xQGvHQvV8U94RwuQ4ZQZRmgmCIy8Cw2fpjV52/H0niP/
 yEHorwV64O3T12duthfIIIadla5bWdlW9wh/+p0klTeiMTRJ3lOc3dQ5NAOmidmvNA
 uaCc+rQRrIFIN7VemH61IctRJL52Kdoromccdo5YhdkH0S7fZ/BN8++WWDWNSh0xg/
 71z9kN93tt9cw==
Received: from localhost.localdomain (unknown [5.181.92.50])
 (Authenticated sender: tomas.marek@elrest.cz)
 by smtp.cesky-hosting.cz (Postfix) with ESMTPSA id 70E75E6A;
 Wed, 12 Oct 2022 18:11:42 +0200 (CEST)
From: Tomas Marek <tomas.marek@elrest.cz>
To: mpm@selenic.com,
	herbert@gondor.apana.org.au
Date: Wed, 12 Oct 2022 18:09:22 +0200
Message-Id: <20221012160924.12226-1-tomas.marek@elrest.cz>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 13 Oct 2022 06:13:10 +0000
Cc: Tomas Marek <tomas.marek@elrest.cz>, oleg.karfich@wago.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] hwrng: stm32 - improve performance
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Fix issues in the STM32 TRNG driver to improve performance.

Tomas Marek (2):
  hwrng: stm32 - fix number of returned bytes on read
  hwrng: stm32 - fix read of the last word

 drivers/char/hw_random/stm32-rng.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
