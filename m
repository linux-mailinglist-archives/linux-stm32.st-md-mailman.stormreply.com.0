Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E508A59F507
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 10:21:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F023C6410D;
	Wed, 24 Aug 2022 08:21:34 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68C30C640FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=QZSYy9ZOyYNn4Sbj+9d4hyd/rRC
 F0R9pMJ4odvD5koQ=; b=YjWlbqTLtYbUvEIgtlAow9FBUx0ubdew9ifp0+2omMx
 FhVJfSolrADooA0wev9GAqSeQvf0h1vL9Qw0sk6rhYMzYf8MEkeFpg5xZJ8w17Oc
 9zrhSfi3HRJ4MNe0KSQV6cuA7P9KPPtoejQ4CLkAHtfzSsk9WSW30CEEv2LvW2aQ
 =
Received: (qmail 2131763 invoked from network); 24 Aug 2022 10:21:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 24 Aug 2022 10:21:31 +0200
X-UD-Smtp-Session: l3s3148p1@jehDXvjm1OcgAwDPXxw3AFlguiwjsjwa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-spi@vger.kernel.org
Date: Wed, 24 Aug 2022 10:21:27 +0200
Message-Id: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] spi: remove "spidev" nodes from DTs
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

There were two DTs left specifying "spidev" directly. Remove them.

Wolfram Sang (2):
  ARM: dts: stm32: argon: remove spidev node
  powerpc/82xx: remove spidev node from mgcoge

 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 6 ------
 arch/powerpc/boot/dts/mgcoge.dts                 | 7 -------
 2 files changed, 13 deletions(-)

-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
