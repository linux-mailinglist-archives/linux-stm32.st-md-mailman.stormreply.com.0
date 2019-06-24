Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD4502F5
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 09:20:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C72CCC241B
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 07:20:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 345C1CC241A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2019 07:20:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5O7Gm0F007581; Mon, 24 Jun 2019 09:20:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yIONWFSs1oKdCqvaOndtOK2au6DElgx93gHb16N6pdA=;
 b=tdZKaSReLQWq+x145acXGNzuTOxthCpcU6H+wKus6fEiLuo8dTGtEONv2HRoSTSBe1ci
 m8rW0Vuqxwm0wV2Lg82xGZEX/vCVXbpcQmia3Lr5MjyM7DSKstaRFUfhReidzZg1a7xu
 LYO75tyU3+iSDt5cmM+irMvvYIybQGvigSX8FN+5BUYL7tzSpf7OTcHHHGPJ6JhLIG0N
 SrubZ601lzVMyIDo4lFAnLck9Q8cuc9J4ETRgVjKFBqCABp76XQvaFnBObVn8c1jCToA
 kAirryQ+WWkhztroKEOxlTVe4F+Mrz8qE8J4U1/VBGZESIGYNA+LGoxwL9R1lf2GLCG3 Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2w9jav-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 24 Jun 2019 09:20:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5484734;
 Mon, 24 Jun 2019 07:20:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3359F15AA;
 Mon, 24 Jun 2019 07:20:41 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 24 Jun
 2019 09:20:40 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Mon, 24 Jun 2019 09:20:40 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Denis Efremov <efremov@linux.com>, Nathan Chancellor
 <natechancellor@gmail.com>
Thread-Topic: [PATCH] mfd: stmfx.h: typo in the header guard
Thread-Index: AQHVKdJKyJAGS3v5qEa3Gl2UX5YQFKaqRXsA
Date: Mon, 24 Jun 2019 07:20:40 +0000
Message-ID: <3d00e9cd-ba4d-73d1-a486-0b4f2c511c9c@st.com>
References: <20190623144459.21608-1-efremov@linux.com>
In-Reply-To: <20190623144459.21608-1-efremov@linux.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <DFE614BF5A257D43A03D62C054DEF94C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_06:, , signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx.h: typo in the header guard
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

On 6/23/19 4:44 PM, Denis Efremov wrote:
> The guard macro MFX_STMFX_H in the header stmfx.h
> doesn't match the #ifndef macro MFD_STMFX_H. The patch
> fixes the typo.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>   include/linux/mfd/stmfx.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mfd/stmfx.h b/include/linux/mfd/stmfx.h
> index d890595b89b6..3c67983678ec 100644
> --- a/include/linux/mfd/stmfx.h
> +++ b/include/linux/mfd/stmfx.h
> @@ -5,7 +5,7 @@
>    */
>   
>   #ifndef MFD_STMFX_H
> -#define MFX_STMFX_H
> +#define MFD_STMFX_H
>   
>   #include <linux/regmap.h>
>   
> 

Hi Denis,

Thanks for your patch. Nathan already sent a fix for that: 
https://lkml.org/lkml/2019/5/10/777.

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
