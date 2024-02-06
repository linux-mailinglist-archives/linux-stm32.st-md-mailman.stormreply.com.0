Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D384B5B5
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 13:57:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82F5AC6B463;
	Tue,  6 Feb 2024 12:57:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC922C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707224230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/1k6MOkR23iKwCezCQdkU1QkjIYXCyaU/n1ekUYcUX0=;
 b=aXDWTmM32ytpijgBXJKXRnsmTrmV3fOFT2RX0xXvoUf8ZhlnydSCsFvpDZMMxYmJ6/Sxge
 KwEFU/EsSq0Yacuet/RgHsfc/NUkxa45ff2hG7gkZ6rdVgwCFRl+pd1mDJkBQpfXL4H2lr
 UtetWm9Wp64HrFkyqhopeJdjTEizyXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-gf9nC3k-Moa4_F3g4KI4QQ-1; Tue, 06 Feb 2024 07:57:09 -0500
X-MC-Unique: gf9nC3k-Moa4_F3g4KI4QQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e354aaf56so13003585e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 04:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707224228; x=1707829028;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1k6MOkR23iKwCezCQdkU1QkjIYXCyaU/n1ekUYcUX0=;
 b=BdpkqpNmKOFyvC7a3M48HZMKXtqDwN5AZ3mPRcgKwff6VQtxfwq/g5vBlC3sr9REzv
 j5/nAyag3k1tQNOuqqyD/LRcGM8h6you3i05wHafJ1/cZeF+A7+1rP0pTLDKftt7ZsEu
 BbDQMv/F+t+6tdsRyMJm6LhKtTxTBpgxgJy42OGHw5So/ceoUZ6wgjrJ8QIXoIOhYKy7
 l4tOwACjucjRHGY7nCZ05r/KldCBWvQL+tVHndL9ivZUUhIAqR87p1C5qW173PuhERCO
 0W+4MZwKrCuq3kZrwYTbGMaUOhTX9iG/HJC668LkCGcK247egP9PrjY4Y6Nb6v1B49sw
 aQpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmjTUIu+w2hr9Zme3LqHWiQKE8LdQSB8doOQT9vt+JDTH09K4v/ueM6bCn6JO80Zsjrd31e6rgI6X78Zr4oUfQlqXDWcI4wTdXFGc2AOhs0g2eh2MCMe5U
X-Gm-Message-State: AOJu0Yz3IHwbwb35l5tuRkBfUiqaMc3a+weD3gh9CktD+BgHRvw37qAq
 cbC/ZG+B+bD241GOg8BFhCvu84NWnPrUREiCwdvazYBTGsOAUlbXSjSgTHPrj2HxxLuAifmeto8
 USW3VtYtu/s0c8FmXZzqVZrviWJB6bNeBuLn//f+ua7UX0GfyOcsdLKpzd19t1B8NtzAHOdr6vF
 29eQ==
X-Received: by 2002:adf:ff87:0:b0:33b:278a:15f5 with SMTP id
 j7-20020adfff87000000b0033b278a15f5mr1561255wrr.6.1707224227961; 
 Tue, 06 Feb 2024 04:57:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+/r+BZJ1AMNA3sDifj1tOVO7pP7JJorz2AxV/XzGUJY3E9lJnU0Ig0zj4E2wS9SNs3sbxeg==
X-Received: by 2002:adf:ff87:0:b0:33b:278a:15f5 with SMTP id
 j7-20020adfff87000000b0033b278a15f5mr1561224wrr.6.1707224227590; 
 Tue, 06 Feb 2024 04:57:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX10sRN0oC/+J0PgFJ0e+6CxNmAR+EoVRUnC55Q8jPprs+DMo8lofnd5V0xLOkzcFCXyjGwEO+/P4hmxx14h3WvgOzgKrLoYzB5P02x3DIbHw81oujWRSRX9qHdDquEyJq0hNaMdwJ+0l1li7amCld4XgNQVLUmwpHaTy0qDBzmPmhQrpVbXqQEZslPm/RG9XDgl7zcAYjlYqJFK9qD8PT4XiNsuYoxxeZskM+PXU6eAIfKo/Dn6B32F5yroddZN+L/vPklBdG7KzuJXl4Do5jNqb9oj+sMDvWpD3LUCobY6iYQq3jWr7F56ynCxevDzAX5HCsFbztkG6pSQT4GQaO1fBinA90nmB4/u7iqd+xpBmuga3DYxHNG6YAyeOOhQdi6ghqtY+dgvfy+8VzmLIf+LpuuXOsFbSaFGeGyRdAn7QqtCLSV80fMeX0oshSB8wE3azFAgMA7Zk9mvhuuwamsEa/2XRqEoB+GBJq+DWDBg0xOI9D//LFfdxjkYLI4qjyrTnYHc47NHvUNMqbjI5OVFSR3P7Fi5dE3QK4aBg==
Received: from gerbillo.redhat.com (146-241-224-127.dyn.eolo.it.
 [146.241.224.127]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d6511000000b0033af3a43e91sm2050801wru.46.2024.02.06.04.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 04:57:07 -0800 (PST)
Message-ID: <1f5fd28c7acaf22e09a8ae41b829ea9ac0a317b5.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Jiri Pirko <jiri@resnulli.us>, Furong Xu <0x1207@gmail.com>
Date: Tue, 06 Feb 2024 13:57:05 +0100
In-Reply-To: <Zb49M9fKRR2HeGhR@nanopsycho>
References: <20240203053133.1129236-1-0x1207@gmail.com>
 <Zb49M9fKRR2HeGhR@nanopsycho>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix a typo of
 register name in DPP safety handling
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

On Sat, 2024-02-03 at 14:18 +0100, Jiri Pirko wrote:
> Sat, Feb 03, 2024 at 06:31:33AM CET, 0x1207@gmail.com wrote:
> > DDPP is copied from Synopsys Data book:
> > 
> > DDPP: Disable Data path Parity Protection.
> >    When it is 0x0, Data path Parity Protection is enabled.
> >    When it is 0x1, Data path Parity Protection is disabled.
> > 
> > The macro name should be XGMAC_DPP_DISABLE.
> > 
> > Fixes: 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> 
> Looks okay, but this is net-next material.

The blamed commit has been applied to net before Serge spotted the typo
during patch review. I think it deserves the net target, so the typo
will never land into vanilla.

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
