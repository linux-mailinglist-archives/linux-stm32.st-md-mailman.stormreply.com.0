Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC722C6625
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Nov 2020 14:01:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFA5DC56631;
	Fri, 27 Nov 2020 13:01:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92F2EC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 13:01:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARCQX1b022358; Fri, 27 Nov 2020 14:01:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=N9+yqyObC4up1jt4XVcmEQWQQISeDtGWU+BIy3jtqu4=;
 b=zoxrkddKbab7uztzquM21tapUo3ZL28jqu7pih0TCHxr5eGZj3+LCN3KpIweHz8R3CMF
 ReBOENVSfQhMz5Tgtlg++Tariiv1ID58KTQz2SqDKwXJEC8iRuVftI8z2pcGXFyRCkyV
 eDZDWe/fbF7cHe+6FKRdiH+hakv+pDo/aZJvB1CuX1e6MwG8zh0gsPOCAKEHx4PrI5gD
 f2L6875o4nwtvi9Y4/NeXvT9cNJyFRzjJIDCTR7DMLbTqSfD8XD3u7wKmuw/pqWofviB
 rudkqImx22SFhiLQp9bPG8lt4rmzSGOWSdu1WJES4vMYXqCISqK0mpsI0CuMtqZpLJmr cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05htp9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 14:01:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AD1C10002A;
 Fri, 27 Nov 2020 14:01:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 310D1247D1E;
 Fri, 27 Nov 2020 14:01:32 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov
 2020 14:01:30 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Badhri Jagan Sridharan
 <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-4-amelie.delaunay@st.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <e97a537a-9c7e-cd98-8ffa-93abae087128@st.com>
Date: Fri, 27 Nov 2020 14:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106165805.31534-4-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_06:2020-11-26,
 2020-11-27 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] usb: typec: stusb160x: fix
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

Hi Greg,

gentle reminder for this patch, lost in the middle of a DT series (DT 
part already in stm32-next).

Thanks and regards,
Amelie

On 11/6/20 5:58 PM, Amelie Delaunay wrote:
> Device tree property is named typec-power-opmode, not power-opmode.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/typec/stusb160x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index 2a618f02f4f1..d21750bbbb44 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -562,7 +562,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>   	 * Supported power operation mode can be configured through device tree
>   	 * else it is read from chip registers in stusb160x_get_caps.
>   	 */
> -	ret = fwnode_property_read_string(fwnode, "power-opmode", &cap_str);
> +	ret = fwnode_property_read_string(fwnode, "typec-power-opmode", &cap_str);
>   	if (!ret) {
>   		ret = typec_find_pwr_opmode(cap_str);
>   		/* Power delivery not yet supported */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
