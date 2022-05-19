Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6452CCFA
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 09:28:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 005BBC03FE2;
	Thu, 19 May 2022 07:28:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3BB1C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 07:28:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J5qka9024416;
 Thu, 19 May 2022 09:28:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HnzhgPXI0wRRfbcKCU/LITbeULiyLCcyHIVfQfy09hY=;
 b=jckhfWnVcR16DbhHd3LV2a9CJ4NEQBGnBpBwi5dJSOqJNPAJlHqc/0aEjCBmBI/n+1HV
 aIQHpWEi/7wxjOYAM5zrAEQTgtlc3GgktenVIkkpm7dKXNb7LqLsf7TiISwLmZUNHi6X
 NgzPIVRN+Aj/yu191VCzTb/+4DY9iTYdfTihP0mTnZ2IUAV1XNEpdLR9IpyaZG3p4D9M
 QoEh5ReOsWpD33eL4eomOotjNA2b1YZkaQl2OiQMx4Dnh3QapCABsgFJ8iuLs4/6ZhVO
 1RiGqMBGlufr1N0BEXXBk9Xn4r5qn1CK5znqwWuoHmNLz3zMR+HLQZ1OiwDSpXwKWZ+O qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ahy521-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:28:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 947D410002A;
 Thu, 19 May 2022 09:28:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A1812128A4;
 Thu, 19 May 2022 09:28:32 +0200 (CEST)
Received: from [10.48.0.183] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 19 May
 2022 09:28:31 +0200
Message-ID: <c04a4e35-15ee-836b-1c9d-46a42abb05d1@foss.st.com>
Date: Thu, 19 May 2022 09:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi
 <jacopo@jmondi.org>
References: <20220516092048.264036-1-hugues.fruchet@foss.st.com>
 <20220516150237.v3xt7onp2lpmellw@uno.localdomain>
 <YoUoJRzStCnzhxUK@paasikivi.fi.intel.com>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <YoUoJRzStCnzhxUK@paasikivi.fi.intel.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_01,2022-05-17_02,2022-02-23_01
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: add support of 1X16
 serial pixel formats variant
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Sakari, Jacopo

Thanks for all !

On 5/18/22 19:08, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Mon, May 16, 2022 at 05:02:37PM +0200, Jacopo Mondi wrote:
>> Hi Hugues,
>>
>> On Mon, May 16, 2022 at 11:20:48AM +0200, Hugues Fruchet wrote:
>>> From: Hugues Fruchet <hugues.fruchet@st.com>
>>>
>>> Add support of 1X16 serial pixel formats in order to support
>>> CSI-2 camera sensor exposing 1x16 pixel formats only.
>>>
>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>>
>> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>>
>> Sakari, if you're sending a new pull request for the ov5640 series,
>> could you include this one as otherwise dcmi would be broken when used
>> with that sensor.
> 
> Just took this into my tree, with your refreshed ov5640 set.
> 
> Thanks!
> 

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
