Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26353464E7F
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 14:08:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2BB2C597BE;
	Wed,  1 Dec 2021 13:08:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 461CFCFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 13:08:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B1BXqVn026536;
 Wed, 1 Dec 2021 12:41:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=y+lWVTF7ChstYU55k0XJsQjtnrTGXQm1BJqRGO3NL6k=;
 b=fAqFS9wDCZu+bDhm+hcsbf59KUJ8W9VyaQ7atI03nhsmoXaaZOeA2iavt3sMIq74FV0h
 KU/Yo9+ZSNWZT/FQWs7zAVH5P+KzL1rGwBOZfLx6ojPnspETMREQJJepOOHPTryuLdcR
 ghlcl+F7KYAPZ1k4v9C+A0TpVrfD632Q75Fk1Wa3iJaFGOGfbPJZBBNtzCOzvJmDhh8/
 lPo/Oqp9/cJHqhaKAyh2l/deOmaB6fdoVS4UlIvBt9zoGmZY9czplaJm/ogLEFW0g+PM
 Jk0tF8S2xwiO3Z0O2jJF1e66KjaZO937vYsaESRWV1boebWQaSkIKSpYkad77PLxyGJE eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnyy6jv26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 12:41:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 618C6100034;
 Wed,  1 Dec 2021 12:41:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5627A2190E8;
 Wed,  1 Dec 2021 12:41:56 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec
 2021 12:41:55 +0100
Date: Wed, 1 Dec 2021 12:41:48 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>
Message-ID: <20211201114148.GA828165@gnbcxd0016.gnb.st.com>
Mail-Followup-To: wsa@kernel.org, pierre-yves.mordret@foss.st.com,
 alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20211201110348.825901-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201110348.825901-1-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] i2c: stm32: A few cleanups
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

Sorry for the noise.  Issue with my mailer.  Will resend properly
the same serie in a sec.

On Wed, Dec 01, 2021 at 12:03:46PM +0100, Alain VOLMAT wrote:
> A few cleanup, removal of unnecessary messages regarding bus busy
> and recovering bus.
> Make the function stm32f7_i2c_release_bus void since it is never
> returning any error message, allowing to get rid of the error handling
> within the calling function.
> 
> Alain Volmat (1):
>   i2c: stm32: get rid of stm32f7_i2c_release_bus return value
> 
> Wolfram Sang (1):
>   i2c: stm32f7: remove noisy and imprecise log messages
> 
>  drivers/i2c/busses/i2c-stm32f7.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
