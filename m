Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7C9EB22C
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 14:49:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A0FAC78006;
	Tue, 10 Dec 2024 13:49:07 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C166C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=ChAIwGV7ZFkveVH5BCfEgrQPKa+agmYwut0/xNKhFek=;
 b=kXQPbSzn+GbtajNR9BYQgkCkT46oSgqEAk3vHk2xh08y8sMDwLyTPHvGVH86JT
 90W2P/YNcISXT49tA0P8H+N7ydzUSjU1PgY33KB8wfr8u29gSsqSif+/UCaq5IZs
 88dVcX/NQ014JwgTSZPM5oBizvpZiAg4d06b2H8j84V0s=
Received: from dragon (unknown [])
 by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3NtRBvVZnJDOOBA--.47668S3;
 Mon, 09 Dec 2024 17:49:55 +0800 (CST)
Date: Mon, 9 Dec 2024 17:49:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Message-ID: <Z1a9QGfVsSzc81ZL@dragon>
References: <20241111113524.10727-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241111113524.10727-1-marex@denx.de>
X-CM-TRANSID: Ms8vCgB3NtRBvVZnJDOOBA--.47668S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaznQUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWsiw1LwAAs8
X-Mailman-Approved-At: Tue, 10 Dec 2024 13:49:05 +0000
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
 kernel@dh-electronics.com, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Update entry for DH
 electronics DHSOM SoMs and boards
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

On Mon, Nov 11, 2024 at 12:34:21PM +0100, Marek Vasut wrote:
> Update the MAINTAINERS entry to cover all DH electronics DHSOM
> SoMs and boards. The DHSOM is the name which covers all modules,
> DHCOM is the SODIMM seated SoM, DHCOR is the solder on module.
> Use glob pattern to match on every DT file which contains either
> of those three module substrings in lowercase.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
