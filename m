Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B08551B0E2
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:11:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65D10C5AB6E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:11:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DA01C5AB6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:11:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4D76Z3g018397; Mon, 13 May 2019 09:11:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JYRjcj+5cTxazjxY/B951yi7qS02YpZMEXM7PHXUwy4=;
 b=yk3DRz8jkDR7UA6D2eC8U4dsHgdTPmqaRYz8IjGjLOcH1jX1pB0SyAHUIJjl24K1zRir
 gTa4zIQm5w45UNYq3hGZqti1aoq0LUd7NAp5h+FQa0ErQ4B+Pn5SKKL+Xl+xgga3bPPr
 Vkp+10au+5USjn4foWaHAYETXA9y60PxWa7PsXTEtBr9RcHf470PDc97ZZGGFrrh2BKr
 fYtD0u9n8XJe6grNK5CQmy3S8PBSEBxFDnnMl8erehwfHP20IHz6D7RE0RFe9Wp0bTsx
 ByQLHvmQTB5fqzIALQRrobxDIynF0FipT0AtxkuYLGoRbOnPt4UiwMyg/UM0A4ykoM5M dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdm5tsars-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 09:11:01 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37CF734;
 Mon, 13 May 2019 07:11:00 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 153CB13AC;
 Mon, 13 May 2019 07:11:00 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 13 May
 2019 09:10:59 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Mon, 13 May 2019 09:10:59 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Nathan Chancellor <natechancellor@gmail.com>, Lee Jones
 <lee.jones@linaro.org>
Thread-Topic: [PATCH] mfd: stmfx: Fix macro definition spelling
Thread-Index: AQHVB5gud9k1UvxEHEasdnpmS8J2KqZohVCA
Date: Mon, 13 May 2019 07:10:59 +0000
Message-ID: <954f759a-4e13-ef95-d461-03cdb385e0a3@st.com>
References: <20190511012301.2661-1-natechancellor@gmail.com>
In-Reply-To: <20190511012301.2661-1-natechancellor@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A0B9C8FAB4FD1041A984A48DD3EB2CCC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_05:, , signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix macro definition spelling
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

On 5/11/19 3:23 AM, Nathan Chancellor wrote:
> Clang warns:
> 
> In file included from drivers/mfd/stmfx.c:13:
> include/linux/mfd/stmfx.h:7:9: warning: 'MFD_STMFX_H' is used as a
> header guard here, followed by #define of a different macro
> [-Wheader-guard]
> 
> Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/475
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@st.com>

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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
