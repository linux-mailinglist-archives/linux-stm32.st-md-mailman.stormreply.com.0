Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2902C6752
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Nov 2020 15:00:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 231C2C56631;
	Fri, 27 Nov 2020 14:00:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6A2FC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 13:46:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARCSE1w021982; Fri, 27 Nov 2020 14:46:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FtHst8KJqUhtN1ezELC4mvYFe4JDkzMGdOLWhYhD3DM=;
 b=EYiAjnTIbQmSTC+3lv1SNN/SMlbOtToz/2C8Cd2jA+fhmHzvWyn8W77eEYCCv/RWHJua
 Eqv4YGHWzTjd8ED54ZfWfPChp4MX7Uh6FbC5tt40HUFXhqQ6DUvZ9cDuOmflpLhAemsD
 aLmPtl4NbIUuYrppOaAmcar7l9YPHHbtUVblN1xOOT1rAOsG9p6bj8RbH5gJhdUce2B8
 jqUwJEdlT5oEG1SqOKGR/lKXzSI/G3q4FdvtWj3u8xzPUMAa0Pipw5MVf6FVfC4F5vRG
 6uIVlOIleQWFbBofvN/5C2Qt0G2M2u4dmviCMiUEyQNWC2Mso4+Lt3NyOAo6ZZx4sbGl QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjwyr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 14:46:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F87410002A;
 Fri, 27 Nov 2020 14:46:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58B2724CBA6;
 Fri, 27 Nov 2020 14:46:45 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov
 2020 14:46:44 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amelie Delaunay
 <amelie.delaunay@st.com>
References: <20201127131735.28280-1-amelie.delaunay@st.com>
 <X8EC6BL98dm+u+8C@kroah.com>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <cb19b270-4917-4783-5e16-41961d4954a4@foss.st.com>
Date: Fri, 27 Nov 2020 14:46:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X8EC6BL98dm+u+8C@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_06:2020-11-26,
 2020-11-27 signatures=0
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:00:20 +0000
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/1 RESEND] usb: typec: stusb160x: fix
 power-opmode property with typec-power-opmode
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



On 11/27/20 2:45 PM, Greg Kroah-Hartman wrote:
> On Fri, Nov 27, 2020 at 02:17:35PM +0100, Amelie Delaunay wrote:
>> Device tree property is named typec-power-opmode, not power-opmode.
>>
>> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
>>   drivers/usb/typec/stusb160x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Now applied, sorry for missing it before.

Thanks!

Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
