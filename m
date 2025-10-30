Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7BDC220E6
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 20:48:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A7FCC62D94;
	Thu, 30 Oct 2025 19:48:04 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 567EAC62D8A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 19:48:03 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-943b8b69734so135599939f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ieee.org; s=google; t=1761853682; x=1762458482;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NyHHMh5+Ig5nWuJhvXvhTG1NXrgVmuFvDzkpLb+CBVo=;
 b=WIK5cPNgO91Z/t65Dipl3xh2qfyanyVssFUK3gvq9p3Pq4j6TTaoq5aRcqV0tHAAxy
 /98pVsnuWfH2FZpKfhriLopNncciHb80igN+nCoilHVytqfRSgyIltjxa9XueIRzicI5
 GqwHHzndHoO1TkQQCWyNClQXUucLC4fA/oN+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761853682; x=1762458482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NyHHMh5+Ig5nWuJhvXvhTG1NXrgVmuFvDzkpLb+CBVo=;
 b=l5osANM8RNER5B9rBuLo0Yg74WukUkz/Scxe1vZFrQFxm9HF46OS2hLis/hWxUo0FU
 uNNq16aQOiJFIsmuL6gT7SjDdbB7nrQrVEzAJUiQCImWr1HVssYi+FJC3cqE+FBjQwGi
 OoYqk8eVEvsONaG3WBay2E/9yBgvCn3E9+W6Sq1qSIKwgWhHSlgmXPHwQ+LPPGW6npbk
 b5Ks2HJNC3akJNYJl6r7eONgY+Cy68HYjOPmngnNhOwHzP75//AFRE15XFt0+XosWPb4
 GMfLHT8qQxgRrqysjAZSDWpV/mQ2I14t8xlicL9rtWDLZYhXas3WCkyBjMOVr3z6dKvg
 4gXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhhcqb45xGmJwpqDLKtHqVwv7kJMJreDr2s/yArVTDR8n3VTlnDnhBm4NmDOG0+Z46X/C3MdXuxOfINA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxw6qIyfkii1tmDsletjKOMU8du60tanrHnAVkl+zYjO29D/OeO
 Im/RnDnF88PvpTOlaYnMBs0GNU2YKjZUVYzVO1nHBhcAnOfxcWNCVu49n3WqUY20zg==
X-Gm-Gg: ASbGncuzqnh3sRGWC9Kl39oF5pN1PD2tSsZOTh5UclGT0icmcMRfsN+y0cy6n3u4eta
 f35FIKJAk+omQnE82xrH5GsBprc8LqqPFdbarR/ZpNldvt5augIbgxpiz/kvPk3N9Tj/Q/sO0bo
 4KW/4duvGSYh/+BrVZtT356fyy+457dUmW2RdFD5mIAK/0f/B1f9YOTnzI95v85plybsfaK3PNx
 Nsw5dLWOGqw/HsiIAxOiFvqPT1Hd1EuRUUH/cOygauE0Y9eH+ygcahUBAUqdy7bCzzVwtMSv3nB
 7H5moJnq+cAfv22t7PLKILlxYgfPM5S3ojWXEA1k/zpjhLgkJb39E1ZmkmSrVcl9iMAzVoJPRIK
 EERZ+X9lPV1oLCUTS5RcNq8MkSf8ySLxtqy/M7hlZievfoGsmOedZ6REGePIZ964Qu1jOPv4+1h
 XRC6bemSP856rszxvb/JR+EPvqfKfQsG2gYWOKYZIVp7rhmg==
X-Google-Smtp-Source: AGHT+IF4U576EpcuWMn8dengv2WlARr6njaCWT9h6oVZ6fzg/nO5M7RbgoKh1r0euu415UbWbr61ag==
X-Received: by 2002:a05:6e02:339d:b0:423:fcd6:5488 with SMTP id
 e9e14a558f8ab-4330d1435a8mr16944295ab.12.1761853681791; 
 Thu, 30 Oct 2025 12:48:01 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-5aea995e701sm6883943173.49.2025.10.30.12.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 12:48:01 -0700 (PDT)
Message-ID: <6cfe0af8-77f9-4f3d-9494-17f4defe6558@ieee.org>
Date: Thu, 30 Oct 2025 14:47:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Cc: imx@lists.linux.dev, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Michael Nemanov <michael.nemanov@ti.com>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Paolo Abeni <pabeni@redhat.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Paul Barker <paul@pbarker.dev>, Roger Quadros <rogerq@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RESEND 2/4] net: ipa: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On 10/27/25 6:50 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_interrupt.c | 1 -
>   drivers/net/ipa/ipa_main.c      | 1 -
>   drivers/net/ipa/ipa_modem.c     | 4 ----
>   drivers/net/ipa/ipa_smp2p.c     | 2 --
>   drivers/net/ipa/ipa_uc.c        | 2 --
>   5 files changed, 10 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 245a06997055..8336596b1247 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -149,7 +149,6 @@ static irqreturn_t ipa_isr_thread(int irq, void *dev_id)
>   		iowrite32(pending, ipa->reg_virt + reg_offset(reg));
>   	}
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return IRQ_HANDLED;
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 25500c5a6928..95a61bae3124 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -903,7 +903,6 @@ static int ipa_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_deconfig;
>   done:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
> index 8fe0d0e1a00f..9b136f6b8b4a 100644
> --- a/drivers/net/ipa/ipa_modem.c
> +++ b/drivers/net/ipa/ipa_modem.c
> @@ -71,7 +71,6 @@ static int ipa_open(struct net_device *netdev)
>   
>   	netif_start_queue(netdev);
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> @@ -102,7 +101,6 @@ static int ipa_stop(struct net_device *netdev)
>   	ipa_endpoint_disable_one(priv->rx);
>   	ipa_endpoint_disable_one(priv->tx);
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> @@ -175,7 +173,6 @@ ipa_start_xmit(struct sk_buff *skb, struct net_device *netdev)
>   
>   	ret = ipa_endpoint_skb_tx(endpoint, skb);
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	if (ret) {
> @@ -432,7 +429,6 @@ static void ipa_modem_crashed(struct ipa *ipa)
>   		dev_err(dev, "error %d zeroing modem memory regions\n", ret);
>   
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   }
>   
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index fcaadd111a8a..420098796eec 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -171,7 +171,6 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
>   	WARN(ret != 0, "error %d from ipa_setup()\n", ret);
>   
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return IRQ_HANDLED;
> @@ -213,7 +212,6 @@ static void ipa_smp2p_power_release(struct ipa *ipa)
>   	if (!ipa->smp2p->power_on)
>   		return;
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   	ipa->smp2p->power_on = false;
>   }
> diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
> index 2963db83ab6b..dc7e92f2a4fb 100644
> --- a/drivers/net/ipa/ipa_uc.c
> +++ b/drivers/net/ipa/ipa_uc.c
> @@ -158,7 +158,6 @@ static void ipa_uc_response_hdlr(struct ipa *ipa)
>   		if (ipa->uc_powered) {
>   			ipa->uc_loaded = true;
>   			ipa_power_retention(ipa, true);
> -			pm_runtime_mark_last_busy(dev);
>   			(void)pm_runtime_put_autosuspend(dev);
>   			ipa->uc_powered = false;
>   		} else {
> @@ -203,7 +202,6 @@ void ipa_uc_deconfig(struct ipa *ipa)
>   	if (!ipa->uc_powered)
>   		return;
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   }
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
