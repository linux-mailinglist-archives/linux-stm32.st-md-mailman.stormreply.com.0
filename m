Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AFB9EC64
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 17:23:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 958E3C35E01;
	Tue, 27 Aug 2019 15:23:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15C22C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2019 15:23:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RFLUt5007886; Tue, 27 Aug 2019 17:23:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=SMKi/mX7zvq/yrjJa5DU8JTV4hHp8R0QThyzkk9s3nA=;
 b=VbqIUTEVJwBhsOXMzWDDM0WvEpGE8M1Fpzxc2dYPMy6ExSX4mLoDAaBLGp0xoV3psUrN
 mrc3zFMXTWIe16z1EzNMiMSfbFZy7ftoqLjmFYBILsTiBut8g6JZQd5nEI98DH322Wln
 ASDN4IZp3FXfucqYou5miezHC83yJBffg2S5FNlcIPC+HGTat3x7bXkz7KJgtCJ+aBGI
 VmJ/Iloca7rnS74AbeTEj9+CiJosfGB28SXarYrcEHbXI/W8pmIhK9hTQd83Y8HhjuMO
 grAuIuqZ2Mwmgsu4JYZvPXmKNXB4OZtpVs2GtNYceuB59H8KhZJ8NoMxsvftLAo9WGkC 6w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujtcbjk3r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 27 Aug 2019 17:23:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 768AE24;
 Tue, 27 Aug 2019 15:23:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A90C72AC1B6;
 Tue, 27 Aug 2019 17:23:31 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 27 Aug
 2019 17:23:31 +0200
To: Jonathan Corbet <corbet@lwn.net>, Gerald BAEZA <gerald.baeza@st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
 <20190827074825.64a28e88@lwn.net>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
Date: Tue, 27 Aug 2019 17:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827074825.64a28e88@lwn.net>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_03:, , signatures=0
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] Documentation: add link to stm32mp157 docs
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

Hi Jonathan,

On 8/27/19 3:48 PM, Jonathan Corbet wrote:
> On Tue, 27 Aug 2019 12:19:32 +0000
> Gerald BAEZA <gerald.baeza@st.com> wrote:
> 
>> Link to the online stm32mp157 documentation added
>> in the overview.
>>
>> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
>> ---
>>   Documentation/arm/stm32/stm32mp157-overview.rst | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
>> index f62fdc8..8d5a476 100644
>> --- a/Documentation/arm/stm32/stm32mp157-overview.rst
>> +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
>> @@ -14,6 +14,12 @@ It features:
>>   - Standard connectivity, widely inherited from the STM32 MCU family
>>   - Comprehensive security support
>>   
>> +Resources
>> +---------
>> +
>> +Datasheet and reference manual are publicly available on ST website:
>> +.. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html
>> +
> 
> Adding the URL is a fine idea.  But you don't need the extra syntax to
> create a link if you're not going to actually make a link out of it.  So
> I'd take the ".. _STM32MP157:" part out and life will be good.
> 

We also did it for older stm32 product. Idea was to not have the "full" 
address but just a shortcut of the link when html file is read. It maybe 
makes no sens ? (if yes we will have to update older stm32 overview :))

thanks
Alex


> Thanks,
> 
> jon
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
