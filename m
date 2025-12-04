Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B7CA31DB
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 10:58:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEA93C58D77;
	Thu,  4 Dec 2025 09:58:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80F31C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764842325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGMYk1sfGljMrx70XS76pz0+JZldIxvVU7ZbZaIA+pI=;
 b=Zeh85N6riuMWszORPbar8CgZ3IZVUbwtfGxM96vWGfrbVdeEijs/rcb3zMm9haHO9gdveQ
 rNXrGvf2mHfYhpcjCMCoP0508fmPPiwWYupXtPyYOQOy5IOP7NCNmQcP7nilBkS7XVzS6o
 1Spl4+prTInQgOxT4rZzXNdu+y6HVpE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-jcme_yQfNaSKBWQ-c5F3aA-1; Thu, 04 Dec 2025 04:58:44 -0500
X-MC-Unique: jcme_yQfNaSKBWQ-c5F3aA-1
X-Mimecast-MFC-AGG-ID: jcme_yQfNaSKBWQ-c5F3aA_1764842323
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42e2d105358so467604f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 01:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764842323; x=1765447123;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGMYk1sfGljMrx70XS76pz0+JZldIxvVU7ZbZaIA+pI=;
 b=efltvawwRfYhtWV+GCWSdk3+aG5/toVhyGtWSZOlq1R3e5rVfQa7EAQN68knkQasFF
 5dRXmFPfrMzv3B4F0WnnjFL/G7pcN+5yN54x4oOfQZZZ+euApDTxiFBw65GunBUgdWAH
 ncGvl02qO/xViAJ5ty2b4ojoSxv7M19GS18CCE/WHav8pUDUVd/Pi8UXpFJLP8KYd3Sp
 bfx95+ROjPkOEAT7A7o4bLGhvMrWRSSqHw+JsH1CN3aNqKyk3mxIyuwlFa7dXnVFSFJp
 7seweZzMS/rJvxSVSoRlGD7DOk3DRod4lzrasSzkCXR8IGROIoiTW7fscguiWf6ErgRE
 UEcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj42QOhCe5zJdl1ADxRH/M0w1RPVjYsd2G+Dndbj+jsgp2NNedaoMhR6QH58aRiNcZrgDRhcypKXggEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybF9DHHEaPRr7LvWQTVHNjgfVf7OrmweVkf4pFm/WYekLzs+mj
 3AGB7ocvedcd2423F7DYwkhvPC8n1kgYxZkT9464g4G94TZ6bCXnrgVDEcdU7KVs/gwhzUtMcn4
 llBrJnnxt7ZaZh0MWVCsi+bDzvJUBsyCIKxl+yOtk4fMJehmZBFy7V4sbUFR4sxb5hfDDkOcfYw
 SIhheyeA==
X-Gm-Gg: ASbGnctp4UwozccfBE0400oppP4f3yd6UpCpRV4JPv7zehWaCryesd+SeBMeLUmbZTy
 t3HeuPimTZsvXIuZSNOWVLzbkESLIpwu5PsBAVIiVNC32YnQx0WyQzexikh7r8hXPX5JoAazsA6
 4cVeq4C4CkQF5WxKWWKIlIfyozheuQrrz+BUr4BLq0DzGdX82YxMU1Mis9sFGvKzOCnVkflZQ+Q
 t8hfoB5PQcLbYlG82S9DHBZhu6E5wQlhWxWiTcl88rFhVH/ajBZbxqVoqGv6JabzRTIY+mcJTOA
 c/em6x/YR7f1sD7FLIRHNnxQmKMECH9/2MDOXLsgQjuzudsZsNFBY//7B0cpEK1rp2GCPsIXx17
 QSiR/NHVIkb1A
X-Received: by 2002:a05:6000:2410:b0:42b:3a84:1ee1 with SMTP id
 ffacd0b85a97d-42f7317dbc9mr5978667f8f.18.1764842322749; 
 Thu, 04 Dec 2025 01:58:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IER0C5ptlDk7jPg7WID0quVbFz2V15FUInT+2qvmmyu5lX8HX6WC9NCtkC3D/YD1+okBxxd+w==
X-Received: by 2002:a05:6000:2410:b0:42b:3a84:1ee1 with SMTP id
 ffacd0b85a97d-42f7317dbc9mr5978625f8f.18.1764842322345; 
 Thu, 04 Dec 2025 01:58:42 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm2297919f8f.43.2025.12.04.01.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:58:41 -0800 (PST)
Message-ID: <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
Date: Thu, 4 Dec 2025 10:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rohan G Thomas <rohan.g.thomas@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 Kurt Kanzenbach <kurt@linutronix.de>
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jtoKPDnNz2seMAyjOt5lKHaJzOuU26jUp9buHh_8rhc_1764842323
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix E2E delay
	mechanism
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

On 11/29/25 4:07 AM, Rohan G Thomas wrote:
> For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> messages show up for dwmac v3.70+ and dwxgmac IPs.
> 
> This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> Agilex5 (dwxgmac). According to the databook, to enable timestamping
> for all events, the SNAPTYPSEL bits in the MAC_Timestamp_Control
> register must be set to 2'b01, and the TSEVNTENA bit must be cleared
> to 0'b0.
> 
> Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
> addresses this problem for all dwmacs above version v4.10. However,
> same holds true for v3.70 and above, as well as for dwxgmac. Updates
> the check accordingly.
> 
> Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
> Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
> Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> ---
> v1 -> v2:
>    - Rebased patch to net tree
>    - Replace core_type with has_xgmac
>    - Nit changes in the commit message
>    - Link: https://lore.kernel.org/all/20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com/

Given there is some uncertain WRT the exact oldest version to be used,
it would be great to have some 3rd party testing/feedback on this. Let's
wait a little more.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
