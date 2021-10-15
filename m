Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FA42ED42
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 11:10:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56121C5C841;
	Fri, 15 Oct 2021 09:10:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05BACC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 09:10:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F3wNkg023305; 
 Fri, 15 Oct 2021 11:10:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=55jDz8cmCoHVVJtcQ73gxGXLtyYGCC5pEpIdPTm+4Po=;
 b=13IoANIYmTKKClJtEhb2KFWiODUglhH5zk/NE+rRqn6kXtPNQnZ+3wVDFJjKlsi4MyC+
 pX47v1GlK6v6ZosqUJa1bjYlwtRzGidNGLURozfqDtqcBfVYeK26NEO5W6E5xG+KyOX0
 JyaEkytTs0KyUso/Y3tX1lvBKfOVg/FjgxO7KW+Ju3MgC1BRwdb2GsV9KvlmM9OkaKRm
 GKCQ78iGxAwOwfneybrD7pZBkkVGgxUrD2V5oX6CGTR2OnuSgcUhDZLQuylkfLS3YsVS
 76LD7/2td65t3ngqAdCY4eaC10gZWiko7mh+aG7zufmI/9k7Kw1oRiwjZjouR8AO0qq9 mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bq270ht80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 11:10:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71762100038;
 Fri, 15 Oct 2021 11:10:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6548121BF53;
 Fri, 15 Oct 2021 11:10:03 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 11:10:02 +0200
To: Rob Herring <robh@kernel.org>
References: <20211005152453.89330-1-amelie.delaunay@foss.st.com>
 <20211005152453.89330-3-amelie.delaunay@foss.st.com>
 <1633473959.465401.106809.nullmailer@robh.at.kernel.org>
 <491ab475-e7dc-eb71-85aa-6d82543b74db@foss.st.com>
 <CAL_JsqLEPd9_4SgmDh8GakyNxQeuMKhJeGzaLbZSdxDJ_-dZYg@mail.gmail.com>
 <2a07f03d-ffaa-77f6-c223-74bae60eb3f1@foss.st.com>
 <YWhz/AsfDX24iUR3@robh.at.kernel.org>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <5fa1f199-cb51-1ec3-9759-fd4362cdd1ea@foss.st.com>
Date: Fri, 15 Oct 2021 11:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWhz/AsfDX24iUR3@robh.at.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_02,2021-10-14_02,2020-04-07_01
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: phy:
 phy-stm32-usbphyc: add optional phy tuning properties
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


On 10/14/21 8:16 PM, Rob Herring wrote:
> On Wed, Oct 06, 2021 at 02:58:21PM +0200, Amelie DELAUNAY wrote:
>>
>>
>> On 10/6/21 2:38 PM, Rob Herring wrote:
>>>> Disable child nodes while parent node is already disabled fixes the
>>>> warning. But it means to add status = "okay"; in child nodes everywhere
>>>> usbphyc is enabled.
>>> Presumably, you already have to add phy-supply everywhere.
>>>   >> Is it normal dtbs_check checks in child nodes when parent node is
>> disabled?
>>> I'll look into doing that.
>>
>> Should I wait for your potential dtbs_check update or should I disable child
>> nodes in .dtsi (and enable them along with parent node in .dts using
>> usbphyc) ?
> 
> I pushed a fix to dt-validate for this.

Thanks!

Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
