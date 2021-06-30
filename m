Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF83B82B4
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 15:11:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BE92C56639;
	Wed, 30 Jun 2021 13:11:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B01C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 13:11:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UCuWkL030029; Wed, 30 Jun 2021 15:11:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=H3KL+ZFSxOlQG3AC+pLdhHar+qjF/Zg5vofpMCp/YS4=;
 b=BXeU0cVvxT3vr5DLBRkLa2pE+zO7mbFCgDTOfBV9xvbHbLuSwkO3liuisOGHiu5CPrUV
 R7y34ZsaFQbzrjyBlh8Bd7WBWVN8DaiMGEwoSig03+3IegBK0Ts83HOfPz2mfMGpmzTS
 ww6B+IOrJ44pbF3j9IqLSUnpOS7AqQ2hBSt9TAcAG+L7/e64VnIzgWKIwtsIT1Gf16Uk
 50pmQRG0mBirGlrSDYbX+qE9UGsvrvYbOPWdn2UmS2LJoRxqBW4ipsHSq71hnLYTQ9vM
 O8T34vmSZxztK/Y4GOKcdI2Xzy6woBzkfitom1kCzgc9lbtANqf5sNm7VJhonTsWfl3Y uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39g4kpxuat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:11:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D21F10002A;
 Wed, 30 Jun 2021 15:11:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5986222D61F;
 Wed, 30 Jun 2021 15:11:20 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun
 2021 15:11:19 +0200
Date: Wed, 30 Jun 2021 15:11:18 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 <linux-mmc@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-i2c@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Message-ID: <20210630131118.GB12109@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
 <YNM/TZMWwCLGSEJO@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNM/TZMWwCLGSEJO@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_05:2021-06-29,
 2021-06-30 signatures=0
Subject: Re: [Linux-stm32] [PATCH 7/7] i2c: stm32f7: : use proper DMAENGINE
 API for termination
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

Hi Wolfram,

thanks for the update. If you are ok with that I modify the patch
to partially rely on _async / synchronize whenever needed and push it again
separately.

Regards,
Alain

On Wed, Jun 23, 2021 at 04:03:57PM +0200, Wolfram Sang wrote:
> On Wed, Jun 23, 2021 at 11:59:41AM +0200, Wolfram Sang wrote:
> > dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> > it should be sync or async. Here, we want dmaengine_terminate_sync()
> > because there is no other synchronization code in the driver to handle
> > an async case.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Eeks, this is called from irq context as well. Broken patch :(
> 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
