Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E98D4071
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 23:44:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A64FC6C855;
	Wed, 29 May 2024 21:44:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFF5CC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 21:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717019084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y0hpOX9YOg0pCIp+iiPW9WCgKyleqs+d+4Let2HWBPw=;
 b=IeAl1/ibFHmzoBoTNKeGr8kymDyAAiClIJSRoMUJFJ2s7evcwDfZxBYpQIkFyrQ7ebNkpM
 Tmmgf6Fwifj+XVepcVigfNwup27cQ3Zf1tlunq8Q8KxBxvhxiHTQDHmnQamcbwsXU/yRzE
 DktSo7soRtMmXXXgcgX1M/gPFYueOXc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-PxmEyi2zNVGhe8aXSo3xAw-1; Wed, 29 May 2024 17:44:40 -0400
X-MC-Unique: PxmEyi2zNVGhe8aXSo3xAw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ae0fd9051eso68106d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 14:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717019080; x=1717623880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0hpOX9YOg0pCIp+iiPW9WCgKyleqs+d+4Let2HWBPw=;
 b=VX7t2QxvYQrLKNalGf/j1YHU3bVfobdi2iU48kJPflRGynYgjrmujVlg+ggSpBRBBn
 wQFogJ+nfmNhLMe4JhxKgG15P/0sTGPFOCl+duknke9JlgBeJ+/SqdeI4vR248WCLPxA
 OHpU/k1Lzy9F4IsPibGc2h2aVrRrzlDsAijjeNyRFqoPMWolSzY6gUj1VdrF1NSD/4FA
 cefHdGBcEZdQcMoxsK8ZTGEhFUFMMcdwMStNM9NLrbt1Ykv16cRwzz1IQ2YnQtJKssjT
 Vn2JBbRWVhANchmOFLg9h3hZSopqeqiluB9VgqcKhdm/V/hG39QDEBq5KBLQq1to8hEm
 0jPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8NECbsGfwFxJCR7d4k7qNpz9G/3jobiBk91l3kXZXY6UBxgsU4y4oci0zlKV+74pVVh3YIMa9Uh8Nw96U+zhwoFJCbwwkTnTDczmMHkXceHPmSe1MMzK9
X-Gm-Message-State: AOJu0Yzce6vQGO08doTgdjuohvt7NLu2MTb0KfYML2DbbhofMycisGpe
 kJqE+KZonTnUMJ98LKpKaFjglGHSQrt7775+wMBIJcYx1yrHYzFteYX8DnuOznnz292L6+he391
 pbBBQdJJpcuXR1hdWZIsd32VhKs/gYPYYRe2l3TCc3X7SDr/yidf+ORLrBD4YIm6x7WlO04633h
 qsCQ==
X-Received: by 2002:a05:6214:3904:b0:6ab:8412:d7bf with SMTP id
 6a1803df08f44-6ae0ccaf367mr4791946d6.46.1717019079926; 
 Wed, 29 May 2024 14:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsFnEGiYlgZOr6BT1kqH8lOCeoyPP2kdowylSkFq9MED4xGC4AoewRV8KgtQLy1zmosdrIKw==
X-Received: by 2002:a05:6214:3904:b0:6ab:8412:d7bf with SMTP id
 6a1803df08f44-6ae0ccaf367mr4791586d6.46.1717019079276; 
 Wed, 29 May 2024 14:44:39 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac070d8f3dsm57860966d6.33.2024.05.29.14.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 14:44:38 -0700 (PDT)
Date: Wed, 29 May 2024 16:44:36 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <3lpjpljgbgig2hgzywnevjixtfuk2pnd4ijscraks6n3gim4i6@ro6a3liims4t>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
 <E1sCErj-00EOQ9-Vh@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sCErj-00EOQ9-Vh@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: stmmac: ethqos:
 clean up setting serdes speed
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

On Wed, May 29, 2024 at 09:40:59AM GMT, Russell King (Oracle) wrote:
> There are four repititions of the same sequence of code, three of which
> are identical. Pull these out into a separate function to improve
> readability.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
