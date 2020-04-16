Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE61AD746
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 09:19:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56E3DC36B10;
	Fri, 17 Apr 2020 07:19:12 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4304BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 19:53:32 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 49C832A23D7;
 Thu, 16 Apr 2020 20:53:31 +0100 (BST)
Date: Thu, 16 Apr 2020 21:53:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200416215328.53982fef@collabora.com>
In-Reply-To: <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Apr 2020 07:19:11 +0000
Cc: mark.rutland@arm.com, marex@denx.de, vigneshr@ti.com,
 devicetree@vger.kernel.org, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 03/12] bus: stm32-fmc2-ebi: add STM32
 FMC2 EBI controller driver
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

On Wed, 15 Apr 2020 17:57:27 +0200
Christophe Kerello <christophe.kerello@st.com> wrote:

> The driver adds the support for the STMicroelectronics FMC2 EBI controller
> found on STM32MP SOCs.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
> Changes in v2:
>  - call 2 APIs to manage FMC2 enable/disable instead of ops
>  - call 2 APIs to manage FMC2 NWAIT shared signal instead of ops
> 
>  drivers/bus/Kconfig          |   11 +
>  drivers/bus/Makefile         |    1 +
>  drivers/bus/stm32-fmc2-ebi.c | 1091 ++++++++++++++++++++++++++++++++++++++++++

Hm, I see that other memory bus controller drivers are placed under
drivers/memory/, any reason for choosing drivers/bus/? If that's where
we want to have all generic memory bus controllers to live it might be
worth moving existing drivers to the drivers/bus/ directory at some
point.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
