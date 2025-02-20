Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0703DA3D3DB
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 09:59:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C2FC7A820;
	Thu, 20 Feb 2025 08:59:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42322C78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740041953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vi69fi8DpFTd/RNozd1wgX4NhzxErJ/nkr6IYJg5tZI=;
 b=YPLqnOPQxjtbUmrqHf6OIWH4m+Cli+6n5WeOu3RiHgDxuAf2ZR4Mqf/KvqBcMr37sbrcxW
 o+EywCwnVGi3qMQbXQTwnWrSB2zMtvGtae+RFymeM3qk2tE6H9kMuzVDHaOJNIYyWi3oCa
 Zbl12CLTAVxg6wYQv9UV7iRjJlYr7AQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-pnqWxW6OMt2zY2_CZqXLGA-1; Thu, 20 Feb 2025 03:59:12 -0500
X-MC-Unique: pnqWxW6OMt2zY2_CZqXLGA-1
X-Mimecast-MFC-AGG-ID: pnqWxW6OMt2zY2_CZqXLGA_1740041951
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f62a0ec3fso350183f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 00:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740041951; x=1740646751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vi69fi8DpFTd/RNozd1wgX4NhzxErJ/nkr6IYJg5tZI=;
 b=sOxxYioU8oD/qEtLOO/8EW3ZgkyvBEP6Sd6sCY+kMMF0k9+pBZmQSKN/jPoLXqorHa
 O2MLaAruZKCMC1yxAT7ipUDdyz4fuVTb1GFR+5jb8yZ2mSVwRIIwDrsp6UIvRhyWsicF
 pyorrBx+3r3mBcgTm8zLB82O4g1uQrh75bss74zwtg9EViDFa/J8b7Sk0gfSPTV4uMbE
 gtdsNNTe8xZlOrgVl8XmkzLIfmElnC3PXOFHJjoLk+yHtlWhvmrlfOmmg3fp26fN7yzS
 VYBCCCxHlyIPIL+wxbbbmp9a+lZ9FlTWULn6kBNHqZaVzDQ5lSq8fQ/evXeKmj67gqrF
 LZhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU5Cz+4/AhXI5KwH4NAFxdPIuyj6c1pZD2erWkB9/AjgjOnIajsQj7zcFpzFga2XIJkmVVaoE1A4KpkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzU9Rl8bagER98tTetohtIW+zMgIQML8LPdBikdd0VUq2dRqnCc
 LqS6BW/xQ1gbEIvYOaEYPZmRUeuM4P8aEIApHJDSs9vQvzXtu6aGQtMq7mP2T19U/xgSoEQR6ik
 zx/bqAfSxy6y1uj1iWch2abipOjPkXvahu3mmNAV+3gR/DYF0W4sX1zASzYwh06fiGiX1X5ESv+
 3vRg==
X-Gm-Gg: ASbGncusQ2+AfQswB/8lpXcAWTSbaeoDLIo7eis+XiAVIglI0cD11/TC2KhSgybvsCC
 xGTTnIaX+oyhptVJ6Jfg/3imfPRrEf2Ngnr6Z8Vx8MU08+qniDKx4s5RF+NeBJKl1OeyiJccY5S
 Dm7ekqF88lfrtpJC8mIBg7ji8baPUA71m07drNtn8bGBGmrQYfla8abw+XyzAy8eP/4gYB9gBhB
 bRu7TkSR2OccjtKPf8XOsy1UK3afzrdCddVOVDoYhrLEYN52LFXoKQXDzpbcz2cKC1KAUn+7hkQ
 D5DyfWNEnxc8fwNkenPM/3BsLVsDskb5uhQ=
X-Received: by 2002:a05:6000:8c:b0:38f:2cec:f3df with SMTP id
 ffacd0b85a97d-38f33f44f80mr15027987f8f.24.1740041950842; 
 Thu, 20 Feb 2025 00:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI9cLg9zTTlh2PcmYGIgTxMmZCopbpnVJC7SeH7bbA6kcEpvNnjuVI80LLj0zkozJx/pc/eQ==
X-Received: by 2002:a05:6000:8c:b0:38f:2cec:f3df with SMTP id
 ffacd0b85a97d-38f33f44f80mr15027962f8f.24.1740041950468; 
 Thu, 20 Feb 2025 00:59:10 -0800 (PST)
Received: from [192.168.88.253] (146-241-89-107.dyn.eolo.it. [146.241.89.107])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25915719sm20217153f8f.60.2025.02.20.00.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 00:59:10 -0800 (PST)
Message-ID: <2dba7bb6-23bb-4e05-b126-b147769ad1be@redhat.com>
Date: Thu, 20 Feb 2025 09:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Yanteng Si <si.yanteng@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>
References: <20250218132120.124038-2-phasta@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250218132120.124038-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tAY0sKpGsEV0gYbZ2MY92eJkblgwIGDEcuiCskGZ3dY_1740041951
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] stmmac: Replace deprecated PCI
	functions
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

On 2/18/25 2:21 PM, Philipp Stanner wrote:
> @@ -520,9 +522,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  {
>  	struct plat_stmmacenet_data *plat;
>  	struct stmmac_pci_info *info;
> -	struct stmmac_resources res;
> +	struct stmmac_resources res = {};

I'm sorry for nit picking, but please respect the reverse christmas
tree above - what is relevant is the full line lenght.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> index 352b01678c22..9d45af70d8a2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> @@ -155,7 +155,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>  {
>  	struct stmmac_pci_info *info = (struct stmmac_pci_info *)id->driver_data;
>  	struct plat_stmmacenet_data *plat;
> -	struct stmmac_resources res;
> +	struct stmmac_resources res = {};
>  	int i;
>  	int ret;

Even more nit-picking: since you are touching this code chunck, could
you please fix the variables declaration order above?

Also, please add the target tree in the subj prefix, in this case
'net-next'.

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
