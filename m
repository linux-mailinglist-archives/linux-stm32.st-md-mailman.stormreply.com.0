Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5D4B140D
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Feb 2022 18:21:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89CB5C5EC47;
	Thu, 10 Feb 2022 17:21:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A7BC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Feb 2022 17:21:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21ABrIwb010080;
 Thu, 10 Feb 2022 18:21:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TzbNxtuk3qaB41Fh0ENW7eLI/HU2Jej09ESsJUDZTA8=;
 b=wGZv7X0ZzSxeucA9AnfnUt8u94mtZ1FbyRi0ymjXRvd2tkNX4Q33pTZ83CP9trIdn8BL
 Cc7JgyaJ0ZGcVKkQJdM5bUoEjECAVJA0RULUvI88MmIB46Tb77TDnQOS6Z3u4f1YqL6z
 0f5jISRF5lB8NJrbTVEzXz6TEymSrAWDLxEgde+NkrX92qOjeqoYrQx4Up/U1+WjUwkE
 7RX1J0J7XTnLqDwY6/D/mWkU1frD9IclcR6gVDZVkZDbCB2OCwDRfZynq5edKt+gRYAa
 xYmmccK7c1+tB3J70PE7kqhkn3v1iPtnc0X96IWCgpJK5aCpdmXFAxAq3jOZJw2tXYm2 Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e4x26bdra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 18:21:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8AF9100038;
 Thu, 10 Feb 2022 18:21:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 082BF22ECE3;
 Thu, 10 Feb 2022 18:21:35 +0100 (CET)
Received: from [10.201.20.208] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 10 Feb
 2022 18:21:34 +0100
Message-ID: <03bb678a-cbfa-bd04-1c69-8ee5109832e5@foss.st.com>
Date: Thu, 10 Feb 2022 18:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <hminas@synopsys.com>,
 <gregkh@linuxfoundation.org>
References: <1644423353-17859-1-git-send-email-fabrice.gasnier@foss.st.com>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
In-Reply-To: <1644423353-17859-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_08,2022-02-09_01,2021-12-02_01
Cc: alexandre.torgue@foss.st.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: drd: fix soft connect when
 gadget is unconfigured
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


On 2/9/22 17:15, Fabrice Gasnier wrote:
> When the gadget driver hasn't been (yet) configured, and the cable is
> connected to a HOST, the SFTDISCON gets cleared unconditionally, so the
> HOST tries to enumerate it.
> At the host side, this can result in a stuck USB port or worse. When
> getting lucky, some dmesg can be observed at the host side:
>   new high-speed USB device number ...
>   device descriptor read/64, error -110
> 
> Fix it in drd, by checking the enabled flag before calling
> dwc2_hsotg_core_connect(). It will be called later, once configured,
> by the normal flow:
> - udc_bind_to_driver
>   - usb_gadget_connect
>     - dwc2_hsotg_pullup
>       - dwc2_hsotg_core_connect
> 
> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks for your patch,

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Regards,
Amelie

> ---
>   drivers/usb/dwc2/drd.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 1b39c47..9b6d44d 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -130,8 +130,10 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>   		already = dwc2_ovr_avalid(hsotg, true);
>   	} else if (role == USB_ROLE_DEVICE) {
>   		already = dwc2_ovr_bvalid(hsotg, true);
> -		/* This clear DCTL.SFTDISCON bit */
> -		dwc2_hsotg_core_connect(hsotg);
> +		if (hsotg->enabled) {
> +			/* This clear DCTL.SFTDISCON bit */
> +			dwc2_hsotg_core_connect(hsotg);
> +		}
>   	} else {
>   		if (dwc2_is_device_mode(hsotg)) {
>   			if (!dwc2_ovr_bvalid(hsotg, false))
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
