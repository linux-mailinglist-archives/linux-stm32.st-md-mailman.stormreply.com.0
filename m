Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAjFHeDCnWmsRwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:25:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D34FB188F4D
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:25:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C0AFC8F28A;
	Tue, 24 Feb 2026 15:25:19 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56146C8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:25:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so54402345e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandelbit.com; s=google; t=1771946717; x=1772551517;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=P27+Z4Mn3VpUEFcO0AEZzb62/MrR0GaThwrhuZeI+7o=;
 b=S8k7kCNW9qYFLHJtD0qSyvLbv1gvelSUMjaXNwLc42re3RXYKsL4Wk4SkCzZT66VcM
 L2LE7yqszsz4I5IcGlaKEz0b0IfdoWGo3Lc1Six0NGT6zRUgwmBCjVVLcv9WYr/z0F7k
 hCcoYHh7Y02Gb7ad+cF2vn1jIl+bYSarRiojOH2qRSt0k9YNPXWHo/dZOZC5JUhogGM4
 /ng2GWgsGifcqyUgnNkrAe0YAUPkgFA+nrYYEzdzeqnKzm64tiuwLK2naZo4hs32CMQ1
 JDIKfth2sNJzqsL/4t9t/ZNtxGmY4PH72T63Adiy8MMuY9u2c8df/CCUEfiqpEuXELd+
 +VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771946717; x=1772551517;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P27+Z4Mn3VpUEFcO0AEZzb62/MrR0GaThwrhuZeI+7o=;
 b=bbNDergIytjgBt+HpPo7NaPNnxP4OmUJqi1xSoiWJrs2NujK2vpfdt4XBybfX8TZpq
 /pFdfIGuUZoHYsRUJzOYzgxYyctYZ/kb6lGzMc1nyiQKaQoK5qR87slVlSwGeoPwYqXR
 rtRAWdWQdUsN/MqtxrXUPj/bCx+Bfu0TJNtaTjeCR/lfwzbCVAXmHxo0lEIFb87bd7ds
 fto4Gt8GCP4i9p+yDzUH4SX+hR7iApLcFa016yovV92ik/yMJyRcKIlYEQbrioeWjaX4
 erqpPP0eDKvOQPMCjQccD9SNSxEqk+EzGbKR4Zwtd74fl4d4SzvuhNbxkgq2B+HGyrgF
 zyxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTCf3KlFDND5l0WGoO4xnETPwmSx8tYwgD64ohc7ZKTcDecX8yr7Z5YgXNUP+YptiDimvKQn59nscFOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNwi+LW84LANSvNuayK2w1Frf08FAGhuEupvupfdZTgx0+yZPS
 Z1RXSE6/JtJayZva46jT0j6DOviKdknY+kAnrpA74tXm+i9wqg5ksTtN+4+ZH7m4igI=
X-Gm-Gg: AZuq6aJX6X69Hl27kuQGCkTc93yxAwRf2m3fNauN4VpgJJCbdDlNUKin3G9k+CgnU43
 DBhwdxa0Lwj5i94Imw9oQo3N/rmaaUKwPoPI0o0RwABSIS+NA7DC3yugPWRxa+9VhefM8ifQLqC
 6JP/xjaN2s57U90IuAtWwWtskdGaSvdKdtDRygXQSN+ZdcTUAzIs+FFEUoPabwwdi5GJV6RPBWw
 dzqt0/iXQh7LsYllfIugIA2cdOnYAYIHTkjj/bfJBMUGm6UKDqcEkSeAjYSFJerckKsndL6pM5V
 /2S+ESeyKHhPC7PFX8ALvWeRumnnBEtvAJYxwl+1ufaGrovo1HtRp7nea28M06H+5Orh0SAOwy2
 //ERluZY5aQvRl4n99up6gU1MSUqAm/lNZzH4FPDMt127n2XRplEx2U0vSmD0/CpwsA9ntX8wfn
 Xl4HsvejCxvXk6C2FVuCb2YVKDwkia9Rgv69C7rellD1YXzvdesCWr71hA/HJ9/AJC
X-Received: by 2002:a05:600c:3b18:b0:483:6e32:50d4 with SMTP id
 5b1f17b1804b1-483a95e9555mr240773595e9.18.1771946716451; 
 Tue, 24 Feb 2026 07:25:16 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:ede2:e79a:81cb:9434?
 ([2001:67c:2fbc:1:ede2:e79a:81cb:9434])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm10632345e9.0.2026.02.24.07.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 07:25:15 -0800 (PST)
Message-ID: <d14f3943-b97a-4940-95dd-39c6fc240130@mandelbit.com>
Date: Tue, 24 Feb 2026 16:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clement LE GOFFIC <clement.legoffic@foss.st.com>
References: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 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
Organization: Mandelbit SRL
In-Reply-To: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix missing pointer
 assignment in case of dma chaining
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[mandelbit.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mandelbit.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[antonio@mandelbit.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:clement.legoffic@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mandelbit.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonio@mandelbit.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,mandelbit.com:url,mandelbit.com:mid]
X-Rspamd-Queue-Id: D34FB188F4D
X-Rspamd-Action: no action

Hi,

On 24/02/2026 16:09, Alain Volmat wrote:
> Commit c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
> introduced a regression since dma descriptors generated as part of the
> stm32_spi_prepare_rx_dma_mdma_chaining function are not well propagated
> to the caller function, leading to mdma-dma chaining being no more
> functional.
> 
> Fixes: c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>   drivers/spi/spi-stm32.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index b99de8c4cc99..33f211e159ef 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1625,6 +1625,9 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   		return -EINVAL;
>   	}
>   
> +	*rx_mdma_desc = _mdma_desc;
> +	*rx_dma_desc = _dma_desc;
> +

Thanks for catching this!

Indeed my fix lost the pointer-to-pointer logic, which was needed to 
pass back the computed values.

This patch looks good, but at this point I think you can also remove the 
lines:

	_dma_desc = NULL;

in the error paths above? Setting them to NULL makes no sense as they 
are not going anywhere.

Regards,



-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
