Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJnoEC6AwmlneQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 13:14:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0897308002
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 13:14:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF48C87EC8;
	Tue, 24 Mar 2026 12:14:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AEEDC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774354475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i878IeteLCFxRLD+ZUMxJT9JCdjyYuc7imdtSz1y2IY=;
 b=DIn9PUCGcGYbtnPVRHg+bRypRvRZRXVADkkn2SEI0uoGZHAXdv8qVdKFhPK16NB6XAJgbI
 5aaYy+dpwWjaiJ00fZJqOWoc96TK4Q4AtrzzGUEa1a2HclQKZHwT9HTCkJyitdYxXavYjk
 vMuUOQwzN4p4cmrKoKfRNU+z7HHWzN4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-ouxnVtBCNwudhesFdPZjCA-1; Tue, 24 Mar 2026 08:14:33 -0400
X-MC-Unique: ouxnVtBCNwudhesFdPZjCA-1
X-Mimecast-MFC-AGG-ID: ouxnVtBCNwudhesFdPZjCA_1774354473
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4853b5b0fafso58062245e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 05:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774354472; x=1774959272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i878IeteLCFxRLD+ZUMxJT9JCdjyYuc7imdtSz1y2IY=;
 b=pZ8T/mdT41Y+gyXTqaf/HeWmUGyL0d2tk659Cv8epsZ2/KmhwvgCmxotj9D3mIzy21
 WxqONR+lvRq39vK+VEdZmSYt91eM98C+c+5/5Vnt3uphMK9Ze/s0NnWb0/qss5E7j06W
 Sbben4Rh5AWPKWJOh8984GbGEiz+E/gFTt2HxCjX7Voz7010VapQgn5fDffQkb31fshE
 pJ7BLdwSDbF/bNuUhO7QE8FykvrvqcScG4/mJPLKRqoPFl0aSTJPURcUi5SlPrZ6bmh4
 BgCM3X41yIHpbIWdHaSD+hjoDamGL3IQ1PYKYHz20Ed+jpeder414MmzvYPH3O2FSdsO
 tkJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQJBQjK8K4uNGJYNYp93s7IwcnBXSgPd86ZgX4bE/b29O5r4bPXpkCUfyhDja0BSTQPS5aTvJxJmmVSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyyg2z81v4GvC5rB4t9GX7RV/sXxui4AuSNS9X5V1E2OHwpfm7a
 JAyPhzm3/Jw0lA1EElZYweCQ95yTbPHjjT8iqSNEpwPuYMHlo2A+CvGDwBcdY8KICyiLxMpYVjF
 LNnHrOESdWwfX+C47hPiJIPUWQoO6I3sl7b7j36FQDBG2vIXsWd0Zb/geFbxGEAP/gdAiL7ZHUu
 KlG6rjuw==
X-Gm-Gg: ATEYQzxoCqrPk1poIPFWwhY0aDSns09umclmA/nc4bLwPoPzuOIH4N7K9garSmhDKpZ
 bSdrIbgppdUzcOeym0FBPvfCCwgJKXOpxHnYk5PpocGCEQEuE4EURpzkIF8GOGsjCxHe1wZStUH
 vjo34k7GYOsB4WH3Uof4HvfZWTdHpEMjx8bO5w3vMxsjCVIofUUmZTv+4jYDMeBxBAvzui8MZXM
 a+ggkZ1EReMEPq7xclyf5fYwkuABa+VnxrKYW5hOKXb2krfhUvqQe8oe4cj5gTrBq4505492W9C
 vogvD7kAUPS2G7S0pwyEkoIwmR15d2Vs92d7M7c4/LaHZC7r8PqDs1YZTUrMAem7oSO0Wnp6Gxf
 MWvE+JXFD2YDR9hYfP+tfY3GOKmWXrNVo95rMT1vE88p+Hn+6CGtQ8gGH
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id
 5b1f17b1804b1-486fedb2545mr263590995e9.11.1774354472370; 
 Tue, 24 Mar 2026 05:14:32 -0700 (PDT)
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id
 5b1f17b1804b1-486fedb2545mr263590405e9.11.1774354471864; 
 Tue, 24 Mar 2026 05:14:31 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871107eda1sm28749405e9.0.2026.03.24.05.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 05:14:31 -0700 (PDT)
Message-ID: <5e5706bb-0f04-4bb1-94f4-45083a3c76fd@redhat.com>
Date: Tue, 24 Mar 2026 13:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3x4I0AylqCBWtx2UQXANkbEWlM0rB9ebw7vPlSJxYAA_1774354473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: skip VLAN restore when
 VLAN hash ops are missing
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.piekos@mmpsystems.pl,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ovidiu.panait.rb@renesas.com,m:rmk+kernel@armlinux.org.uk,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[mmpsystems.pl,lunn.ch,davemloft.net,google.com,kernel.org,gmail.com,foss.st.com,renesas.com,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email]
X-Rspamd-Queue-Id: D0897308002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 6:38 AM, Michal Piekos wrote:
> stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> "Failed to restore VLANs" error even when no VLAN filtering is in use.
> 
> Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
> 
> Tested on Orange Pi Zero 3.
> 
> Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> This patch fixes a noisy "Failed to restore VLANs" message on platforms
> where stmmac VLAN hash ops are not implemented.
> stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> VLAN hash ops presence which results in -EINVAL. 
> ---
> Changes in v2:
> - Replace check for hash ops with check for HW FILTER flags
> - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6827c99bde8c..cfc0ce9cec9c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
>  {
>  	int ret;
>  
> -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> +	if (!(priv->dev->features &
> +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
>  		return 0;
>  
>  	if (priv->hw->num_vlan)
Adding Russell.

It's not obvious to me that with this change the
restore_hw_vlan_rx_fltr() and vlan_update() callback are still invoked
in all the relevant driver/features permutation.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
