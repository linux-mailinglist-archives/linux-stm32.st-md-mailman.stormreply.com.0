Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCA464C3E
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Dec 2021 12:00:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20BA0C597BE;
	Wed,  1 Dec 2021 11:00:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 060DACFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Dec 2021 11:00:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B18KtIV005616;
 Wed, 1 Dec 2021 12:00:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=3p8hf60x3MN36gSfgRlizyRmbFUL0MtXRK+OAqeqejE=;
 b=DCnp1tmRSfZ0IeJiok1WKICqN5ZzAiI2x3+BxIs9VKDvhfsRJCcn8SyJoPEnc2gPpmqn
 iDz66tvGJz3mX3mx5752PcXC0fQ9vjh75n3iv28sAqQT+O1d54gy4tBWMqPdc+zOKmN7
 Ads/qZDKHedB5GdoFyKe5iO6KTClJRU1+J/17IyzrFQzyD16Vz7yhZCEgyYglhLJrmep
 61DeKlTChmk3oVWMLIzm2HJA/6fQD95R7ln4plfei0lgDBn0LSeag6d3zlp9p3+4dR5e
 TDhYgJi63yq08A8Zg9JlW1/5d4yFZV3cggalA+5y8dWrzUb9YogtbMyZWFAxOGb2Y6jF Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnx6ck24u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 12:00:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29A8C10002A;
 Wed,  1 Dec 2021 12:00:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CE16215150;
 Wed,  1 Dec 2021 12:00:00 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec
 2021 11:59:59 +0100
Date: Wed, 1 Dec 2021 11:59:53 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <pierre-yves.mordret@foss.st.com>
Message-ID: <20211201105953.GA825735@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 pierre-yves.mordret@foss.st.com
References: <20211130093816.12789-1-wsa@kernel.org>
 <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
 <YaaakSa16Dun6b+h@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaaakSa16Dun6b+h@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: remove noisy and imprecise
	log messages
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

On Tue, Nov 30, 2021 at 10:41:37PM +0100, Wolfram Sang wrote:
> 
> > - looking at this area of code again, it appears that the function stm32f7_i2c_release_bus
> > is ALWAYS returning 0. So it should actually be a void function.  I thus
> > propose, if you agree with that, that I propose, and apply a patch PRIOR to your/this patch
> > to change that and remove the error checking of the stm32f7_i2c_release_bus function since it is useless.
> > Is that fine for you ?
> 
> Well, I'd think we can also apply this patch first and then make the
> function void, but I don't really care about the order. But we should do
> both, I agree.
> 

Ok, I thus send a 2 patches serie with mine and yours reworked on top of
mine together. Hope you don't mind.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
