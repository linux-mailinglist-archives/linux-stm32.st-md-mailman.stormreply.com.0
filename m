Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94237462F15
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 09:56:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46DBDC5A4D4;
	Tue, 30 Nov 2021 08:56:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EA28C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 08:56:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU6eth0000494;
 Tue, 30 Nov 2021 09:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=6a8nITZiU0Po48YLbpF42GkCXHu+wbzPhZFof3AiSYU=;
 b=btzVLl/RvuNBsF5pqT6k7kIv2qoxy171PcgHBvHWjZtsXbnId2CuEdGV/B16ANPp2SBf
 syBUiHmXKWU6fpUcYnLkvlxDw1upKKQOGSMSq3vYqoNDFRY5zwsZYeSKOOOa1eGkoxAG
 SyD/OK+LwDRTFWGONh/gDV+HzJmcWAecBRoGCr5sYSGw87b1QmRB/Q7WK1bAUDxz+aHc
 RajPAVOzbq+pPVKLpIPzWJbu0ArvwfBLjx8UR2Y5N7sxEzvxuJ6cHZV37OzYru/Mn/xs
 ypjlTcu2abfglgsZnctwnca7/+s/LBwPZY671TtPd+7xbUdXHcthVEDINNJ1H0Uo8mjK FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnewbgse7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 09:56:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CBAF10002A;
 Tue, 30 Nov 2021 09:56:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0075721E674;
 Tue, 30 Nov 2021 09:56:25 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 09:56:24 +0100
Date: Tue, 30 Nov 2021 09:56:18 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>,
 <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fabrice.gasnier@foss.st.com>, <amelie.delaunay@foss.st.com>
Message-ID: <20211130085618.GA668426@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
 <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
 <YaTNDq7rEyQIopim@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaTNDq7rEyQIopim@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_06,2021-11-28_01,2020-04-07_01
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: stm32f7: recover the bus on
	access timeout
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

Hi Alain,

On Mon, Nov 29, 2021 at 01:52:30PM +0100, Wolfram Sang wrote:
> Hi Alain,
> 
> > > > +		stm32f7_i2c_wait_free_bus(i2c_dev);
> > > 
> > > This does only a controller reset, not a bus recovery with 9 toggling
> > > pulses, or?
> > 
> > indeed. I might better rework this and at the same time introduce the
> > bus recovery mechanism via the bus recovery callback in this driver.
> > Please don't merge this patch and I will rework that.
> 
> Wait a sec. Resetting a controller at the end of a failed transfer might
> make sense if the controller is otherwise in an confused state.
> 
> Full bus recovery (9 pulses) should be done at the beginning of a
> transfer when SDA is low, though.
> 
> So, I'd actually suggest to apply this patch and add full bus recovery
> based on SDA low at the beginning of a transfer seperately.
> 
> What doo you think?

I just checked again.  Indeed, this patch is here to handle cases when
communication went bad with a device leading to controller being left in
a confused state.  This is done to put it back in a working state.

I agree with you on the fact to decouple this with the 9 pulses bus
recovery and first apply this one first.

Thanks.
Alain

> 
> All the best,
> 
>    Wolfram
> 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
