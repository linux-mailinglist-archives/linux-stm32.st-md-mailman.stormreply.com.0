Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F190814FB1
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 19:28:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB6C0C6DD6D;
	Fri, 15 Dec 2023 18:27:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 452FAC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 18:27:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BFFOjxN006697; Fri, 15 Dec 2023 19:27:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=selector1; bh=BjOqj4pPwqHC177zwB45U
 ceMHy2woG5K27cvATFEIgQ=; b=xVG+9PPMP/NNfvHzLlg8bFX0nUwQRQagg6eHK
 EymLJP1VCsqopbltlFV9CW89DE9+PN0LQyuUIBrgxYUe/5y/CCIm5Z3a+4OrKd42
 uhy4bOUH3+/MzhXqUvF+GEpfUaP0fMaIkuOeUnSG+jUk5I/75fpc3+qMlkb3hZn3
 EXAQoAhjalrA+V86WAV7vCKCkJoYCR2nH/g+lhBQDjCZ1v6ozi9VXkhi94PuLjFT
 eUgb4pmOG0xrbxYzun2xw2fUZcPAPkYpz0j114FdGbZJmwkVQdjR1Q2MWPxJx/Qu
 ++NcfFYImtxked1Z++nhgr2Fr2lif4O/I8xlAjwlJvaT7o2sg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0hapcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 19:27:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 624B0100052;
 Fri, 15 Dec 2023 19:27:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5928424C433;
 Fri, 15 Dec 2023 19:27:45 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 19:27:45 +0100
Date: Fri, 15 Dec 2023 19:27:39 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20231215182739.GA96945@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Mark Brown <broonie@kernel.org>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20231204202055.2895125-1-ben.wolsieffer@hefring.com>
 <58897511-3187-4583-bf29-11871dd4d136@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58897511-3187-4583-bf29-11871dd4d136@sirena.org.uk>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: use runtime PM to
	enable/disable controller
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

Hi,

sorry for the delay.

On Thu, Dec 14, 2023 at 10:58:54AM +0000, Mark Brown wrote:
> On Mon, Dec 04, 2023 at 03:20:55PM -0500, Ben Wolsieffer wrote:
> > Instead of disabling the SPI controller between each message, do it
> > as part of runtime PM.
> 
> This doesn't apply against current code, please check and resend.

I rapidly gave a try on this patch on top of the spi/for-next branch
(manually fixing the conflict due to the MASTER->HOST renaming).
It turns out that with that applied, transfers on the MP13
(compatible: st,stm32h7-spi) are not working anymore while simply
removing it back it works again.
(test is simply doing loopback spidev_test)

spi mode: 0x0
bits per word: 8
max speed: 500000 Hz (500 kHz)
TX | 8D D6 73 8B 9D 8B 1C 7D 8D 80 EC 32 F9 0D BA AD 9F 88 A5 9B 3F AA 48 8C 21 35 0D C1 C8 E5 6A 81  |..s....}...2........?.H.!5....j.|
RX | 8D 00 00 00 D6 00 73 00 8B 00 00 00 9D 00 00 8B 1C 00 00 00 7D 00 00 8D F9 00 00 00 BA 00 00 00  |......s.............}...........|

The RX data contains lots of 00 between each byte.  Moreover it seems
that with this patch applied non-dma transfer (when there is no dmas
properties within the node) are now failing.

I'll check that and give more details but could you avoid applying this
patch for the time being ?

Thanks.
Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
