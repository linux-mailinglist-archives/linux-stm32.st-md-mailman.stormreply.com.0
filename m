Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A761137380F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 11:49:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E93C5718F;
	Wed,  5 May 2021 09:49:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A95C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 09:49:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1459hJda011331; Wed, 5 May 2021 11:49:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=U1j+kkMEVDtIpXFolKJBxuRWb0u7O4P5oXrM2MRHZkY=;
 b=6P846THNTdNrs3vLTVDlCsfdrFCHEP1i6pdMBz1Rre5lvSFdfSMss/sTLosSLtf1LF4L
 yZ/Px3dmz19RCwhw4ucxDkFMR6kNA2qzdEYeX3jPE/tXWbccABFzXnALHjl6oQsdcqkS
 LF9jTLzk4MtYKjz+Sp6HnpONNmKgv4pV3QPP3H/6uHvdFjoHKz258/+MRsDsUJn8SV2V
 WkJUdVz2u5Ry/KQ2YcsezEpvTSsB1msBIXr/jwkO6Ei/HUipy9/R9FbiKjgJnZjpp/TK
 QlgrKacRR1P1Z1BybImQnBxSdC5LFTsUlmt7MTv++MAZIOnIRAfWXfAccjcl1NmlxoPf Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38bea3u91e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:49:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49317100034;
 Wed,  5 May 2021 11:49:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28B442199A9;
 Wed,  5 May 2021 11:49:22 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May
 2021 11:49:21 +0200
Date: Wed, 5 May 2021 11:49:16 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa@kernel.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fabrice.gasnier@foss.st.com>
Message-ID: <20210505094916.GA27818@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
 <1616998145-28278-2-git-send-email-alain.volmat@foss.st.com>
 <20210504195348.GB1783@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504195348.GB1783@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_03:2021-05-05,
 2021-05-05 signatures=0
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: i2c: stm32f7: add st,
 smbus-alert binding for SMBus Alert
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

On Tue, May 04, 2021 at 09:53:48PM +0200, Wolfram Sang wrote:
> 
> > +        st,smbus-alert:
> 
> After reading the specs again, I think we can make this a generic
> binding. SMBusAlert is optional. So, we can say it is not covered by the
> "smbus" binding and needs a seperate one. Makes sense?

Indeed, SMBus Spec [1] mentions about SMBALERT#:
An optional signal that a slave device can use to notify the system
master that it has information for the master

Hence it does make sense to separate it from the smbus binding. I will
post a v4 of this serie with the addition of a generic binding 'smbus-alert'.

Alain

[1] http://www.smbus.org/specs/SMBus_3_1_20180319.pdf

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
