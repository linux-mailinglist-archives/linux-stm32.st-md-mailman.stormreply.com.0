Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF33787B
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2019 17:48:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE06BC20B67
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2019 15:48:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C052C20B66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2019 15:48:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56FkhkV020575; Thu, 6 Jun 2019 17:48:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=gGCf28774irLLSKFXYWcYkPoYMFVE7Vt0PR7IMC2LZY=;
 b=fiBqVAL0EjZRJKzxblB62imKyCV/3cHFrVj4nR7fLs+a/s3NvoQw7ufiFo+9e11zwXEP
 u6e+P4AuuRwKzycKkiEs1eRtvV2hvnDVLIjFjmlLeN7lp3wPaNbh14hKEJpJsF4627sB
 XyDc6XL1YvPfTrxEfNpPPLlAS42B2MLCGdT5xuX91wA12Yh8HpnJTKOtk6H32aD2tlrh
 TjxuKeQUbGbUi0N3fAiNYbu0rjZmiMb8ITYZohDjGcc6ro1VlR4gRGGd21uV+pxj+7qX
 WW6n3WuKH84RFDTMDti12vRtU3vZf8YSObvVg6v82gm9spc07XTRLfh4zWYfwEPbozhO vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sxqxmv5ws-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 06 Jun 2019 17:48:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7A9B31;
 Thu,  6 Jun 2019 15:48:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E6812B23;
 Thu,  6 Jun 2019 15:48:06 +0000 (GMT)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 6 Jun
 2019 17:48:06 +0200
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1347.000; Thu, 6 Jun 2019 17:48:06 +0200
From: Erwan LE RAY <erwan.leray@st.com>
To: Borut Seljak <borut.seljak@t-2.net>
Thread-Topic: [PATCH v3] serial: stm32: fix a recursive locking in
 stm32_config_rs485
Thread-Index: AQHVHFHrSWlGRhgeoU6uFgV0pT5nv6aOpEqA
Date: Thu, 6 Jun 2019 15:48:06 +0000
Message-ID: <e0f8d4b2-a622-3758-473b-b78bd8949323@st.com>
References: <erwan.leray@st.com> <20190606101901.31151-1-borut.seljak@t-2.net>
In-Reply-To: <20190606101901.31151-1-borut.seljak@t-2.net>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <E7F0DC97BDB15B4E944187432787DEC1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_11:, , signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: fix a recursive locking
 in stm32_config_rs485
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


On 6/6/19 12:19 PM, Borut Seljak wrote:
> Remove spin_lock_irqsave in stm32_config_rs485, it cause recursive locking.
> Already locked in uart_set_rs485_config.
>
> fixes: 1bcda09d291081 ("serial: stm32: add support for RS485 hardware control mode")
>
> Signed-off-by: Borut Seljak <borut.seljak@t-2.net>

Hi Borut,

Thanks for your patch.

Acked-by: Erwan Le Ray <erwan.leray@st.com>

Please correct a typo in commit message: "Fixes" instead "fixes"

Erwan.

> ---
>   drivers/tty/serial/stm32-usart.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index e8d7a7bb4339..5d072ec61071 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -105,9 +105,7 @@ static int stm32_config_rs485(struct uart_port *port,
>   	struct stm32_usart_config *cfg = &stm32_port->info->cfg;
>   	u32 usartdiv, baud, cr1, cr3;
>   	bool over8;
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&port->lock, flags);
>   	stm32_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
>   
>   	port->rs485 = *rs485conf;
> @@ -147,7 +145,6 @@ static int stm32_config_rs485(struct uart_port *port,
>   	}
>   
>   	stm32_set_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
> -	spin_unlock_irqrestore(&port->lock, flags);
>   
>   	return 0;
>   }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
