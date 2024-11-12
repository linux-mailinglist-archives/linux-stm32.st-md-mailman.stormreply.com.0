Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAE9C51F6
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 10:28:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F273C78F78;
	Tue, 12 Nov 2024 09:28:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40933C78F77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731403708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LRFE7o764/lq/KwAISV7bJ6SwNHRnb2w6OTp6CEmqg=;
 b=E9pdjrZEa+lXfgulWNVr3UF/GEzV2QSqoh5dYx8naO7LTSlZfRRsBLNO6wIzev101uPcTR
 VtF7Q2NEjuE+9pULzhiBou6xcV2tzVGDfcFeQNcPw8gmupKYnkwY4orePaHprz8K9Pm9aN
 ecdorWXqqRzapWWgXkC8HPNNBndgXqk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-iQltjyVsMCyrmMaWUxyfRg-1; Tue, 12 Nov 2024 04:28:27 -0500
X-MC-Unique: iQltjyVsMCyrmMaWUxyfRg-1
X-Mimecast-MFC-AGG-ID: iQltjyVsMCyrmMaWUxyfRg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d458087c0so3866095f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 01:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731403706; x=1732008506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3LRFE7o764/lq/KwAISV7bJ6SwNHRnb2w6OTp6CEmqg=;
 b=GCtJ129s8doqQDAV/2ETkqIOvRTfeDZD1XmSmZjgFJqZlzsQic2do6lgnPpZ5LyFjD
 OEoKaJBYTgxnjWrRX8fbikS/49Jq4xshDTz8pe9C331s22+hJbOqLVj271QiATbelqir
 WUhAsSO1BWgYV77t6U7bs7NweUC+V2j20W1TZ1nvteK3tFqIO9pbuqowZFHs/2zYePRr
 jyJleJ6Xxx3KdfB6ovrJIhf1kEejAdodeiryd9xf9SxGLSfkwwcqbKMgFX8KWs5zXTON
 TsDseSiz9HaaiUO629J4hSiBa3Irku9H6JA3lUFfz39+kGo9ldoSG8B3m+XTv9P1yOeZ
 YHtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRYG4dmg0VoeJKdnxlHo5JGpTr+ESTevNkg8ZLu01o4LFOEv9788v3xewnoprVE/JqJtHoVHf3LrSvxw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEjB3FG115uf3tGl1SfqiUkt9m1kcqPRO4WNjIC27HyG51AG6z
 nR3wMx8bchAm0RJRV38+q5f2julZ/p3RA532EOuj81CIi8P0GEzHFyzu13x1gfN/KN+dgvFxo32
 5DnTI2PzuL6vilnjoJYQDdbry4Cl1Ay6nQXH5bNNDAdSWkKJnE95MemiRS8pMNWU1VZlwtUAHpS
 9Vig==
X-Received: by 2002:a05:6000:18af:b0:37e:d6b9:a398 with SMTP id
 ffacd0b85a97d-381f0f58473mr15019450f8f.9.1731403705772; 
 Tue, 12 Nov 2024 01:28:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeFow1WF3RCdO19wHgFR4siQkWFoCuOojrbHUtDMVrlBsQ3slzVULhivX2xSddNA9hsGCcXA==
X-Received: by 2002:a05:6000:18af:b0:37e:d6b9:a398 with SMTP id
 ffacd0b85a97d-381f0f58473mr15019417f8f.9.1731403705441; 
 Tue, 12 Nov 2024 01:28:25 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5bddsm206187215e9.38.2024.11.12.01.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:28:25 -0800 (PST)
Message-ID: <1b335330-900e-4620-8aaf-a27424f44321@redhat.com>
Date: Tue, 12 Nov 2024 10:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
 <20241106090331.56519-5-maxime.chevallier@bootlin.com>
 <20241111161205.25c53c62@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241111161205.25c53c62@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ijWiYbLa3sbW5m2BMs067Oxzo3sAaR7y0mFkqY-Wa9E_1731403706
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/9] net: stmmac: Introduce
 dwmac1000 ptp_clock_info and operations
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

On 11/12/24 01:12, Jakub Kicinski wrote:
> On Wed,  6 Nov 2024 10:03:25 +0100 Maxime Chevallier wrote:
>> +		mutex_unlock(&priv->aux_ts_lock);
>> +
>> +		/* wait for auxts fifo clear to finish */
>> +		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
>> +					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
>> +					 10, 10000);
> 
> Is there a good reason to wait for the flush to complete outside of 
> the mutex? 

Indeed looking at other `ptpaddr` access use-case, it looks like the
mutex protects both read and write accesses.

@Maxime: is the above intentional? looks race-prone

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
