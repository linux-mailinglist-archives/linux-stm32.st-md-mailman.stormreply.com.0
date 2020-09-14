Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1607268C0D
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Sep 2020 15:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74108C3FAD6;
	Mon, 14 Sep 2020 13:18:45 +0000 (UTC)
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 7EDD5C3FAD5 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Sep 2020 10:33:42 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx2.securetransport.de (Postfix) with ESMTPSA id 4025B5E879;
 Mon, 14 Sep 2020 12:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1600079597;
 bh=QqiALWQWqzk3v5Egngf7/oNah0zdhttVToTd3Q1YPvQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=tkjqpb1o8Of4A2fKxnLJoTJGfj3Sgr2FaVttqYfn6gwrqcAPlozgl5MpScJ/8J7vb
 +F7vh1Z/4Il6S6ICqH668xixkwxizgft4T0+gSpEITbuEROGQiU/OVmSrGh4CX1Msm
 9Twyh5t3llDHa3qPPhy+Doy49mMQ+1TU82yDjNz+uFmAzB/ZUPXs2zaaLjUYn0kIID
 BLbQDu3+iXvqwd+7hBQINr5Agq35uSPcJWt1VqkeB0r66OMlUsDVUomW1UhmeXDU4u
 7usFuA7bMc7yy7Imb/9Ne2T4JGI69wb1suEW9Un+ec3f5fbFkiwzDElqHKVJclP0R0
 O3NI5qCowHLqA==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) by
 DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4; 
 Mon, 14 Sep 2020 12:33:10 +0200
Received: from deb10-lzenz.dh-electronics.org (10.64.6.180) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4
 via Frontend Transport; Mon, 14 Sep 2020 12:33:10 +0200
From: Ludwig Zenz <lzenz@dh-electronics.com>
To: <alain.volmat@st.com>
Date: Mon, 14 Sep 2020 12:33:00 +0200
Message-ID: <20200914103300.5832-1-lzenz@dh-electronics.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1597043558-29668-3-git-send-email-alain.volmat@st.com>
References: <1597043558-29668-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-klartext: yes
X-Mailman-Approved-At: Mon, 14 Sep 2020 13:18:43 +0000
Cc: marex@denx.de, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/5] spi: stm32: fix fifo threshold level
	in case of short transfer
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

> When transfer is shorter than half of the fifo, set the data packet size
> up to transfer size instead of up to half of the fifo.
> Check also that threshold is set at least to 1 data frame.

Through a git-bisect we have identified this patch as problematic. We have an application that uses a SPI protocol with telegrams of length 2 to 16 bytes. Due to this patch we have errors in the data transfer of the MOSI direction. We use SPI in PIO mode.

Please explain what this patch should improve or what exactly is changed in the behaviour.

best regards,
Ludwig Zenz
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
