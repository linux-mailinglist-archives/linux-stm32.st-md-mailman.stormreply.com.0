Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF05998783
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 15:22:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 975DCC6C855;
	Thu, 10 Oct 2024 13:22:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55F33C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 13:22:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A8iLrg000495;
 Thu, 10 Oct 2024 15:22:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=Ccn+f/QO1SGOWh5NjiitG2bf
 +psS5zLHBT5PvfxdYR8=; b=xdy6LJKZivFTdUh1VV1XDLky5AuuZTcrXAWwIwsO
 xTDkhIVExC/Q0Tc5IPCvrDtczIXuyTotXmE5JDF6Z3ut433A1hs1hKYWg6B2x6p7
 4iMon06BvLBivZOY0doHSLiNagHWbGlaD7Kh9/LJH9byEg8ll9GONLBWHTsA9SX5
 abVuehsNY/FqSJqmR3tlxicJ7/MYbfL75u/OECm2Jz14ChQtjllpRIcqFfyJmJ5U
 oFgZbhyXaXXAhq9czU7KQTV3g+K81baE6TEZQj2dZ0tjaZ+WR3SxdlyviILpudra
 2GhehTbDClUyxmZyQ+YHZb1bdFzWlI3iq2NYlu1Q0pj6fw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f1173q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 15:22:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AD4B54004C;
 Thu, 10 Oct 2024 15:21:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A59E23CB43;
 Thu, 10 Oct 2024 15:19:34 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 10 Oct
 2024 15:19:34 +0200
Date: Thu, 10 Oct 2024 15:19:29 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20241010131929.GA3275914@gnbcxd0016.gnb.st.com>
References: <20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com>
 <ZwavaP0QHQCyDbtB@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZwavaP0QHQCyDbtB@finisterre.sirena.org.uk>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix missing device mode
 capability in stm32mp25
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

Hi Mark,

On Wed, Oct 09, 2024 at 05:29:28PM +0100, Mark Brown wrote:
> On Wed, Oct 09, 2024 at 06:15:52PM +0200, Alain Volmat wrote:
> 
> > Fixes: a4e7908abf0c ("spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc")
> > Cc: stable@vger.kernel.org
> 
> That SHA1 doesn't exist...

Oups, sorry about that.  Sending a v2 with correct SHA1.

Regards,
Alain


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
