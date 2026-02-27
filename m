Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOwTHZq6oWlhwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:39:06 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC21B9F81
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:39:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D46F8C87EC5;
	Fri, 27 Feb 2026 15:39:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AB8FC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:39:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4806b8fca44so2953765e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772206745; x=1772811545;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wAkEyJJOJ/JdV7CNjPcqTwZJK7pvth1XKt8oYwJ3QEI=;
 b=OzH5BBhdE4ui+5HS7oAYEbfZ1CUhhRDj+UxDtwO3WAl8jm1ffJvDPcFsihuJuPPCzb
 a2jLK+64jqwV2GFvZkMHka0Rk5wVlrQmV3nuJ9EzEOfMfY2xTXBFKm7MX6HPuHfHf//5
 WQU2p8HRIU22nWVXtRIvjc7CeJ4XfJMH5I0bMBCJE0eyHySxSIq6hSCkV2OX3POpGw+m
 SfJkjGFtaKEcizuC3HjpVNOCyKxaVQcxUzfhHYBexSz/CkBm0udc2gseS7I7Ftx4/I5u
 d/dU7YGgLLZGByUvelhyNqJCCQ+KIEVKeQuTc4aB83Bz5Uy+0Sa3scQgU5Sk4ounXl8l
 2KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206745; x=1772811545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAkEyJJOJ/JdV7CNjPcqTwZJK7pvth1XKt8oYwJ3QEI=;
 b=FaRPCPtKuwbUU77EPR14O6YRswYgvjcODRn30t6CoGMbeI9T8jtwT2M109uGWNVySY
 E5gxui79oykQtUg9rEPU8eLtVsSxx7NNLTF3Z1WSWwy2LaRIFRl5UgTRMhpGqGmFLA18
 WCMFwibsJ0P25d36iODhHPTAJbQZ2YbVC530f20kqctuJheTXhWjZxQs24fwgfCnYUfX
 fawxGjjZh2W3Jo2c7rE6ic2W6zaoZmu+jAmta6SXEL1m9XMIIAqizpIvK0V+X3wdAWBR
 apVmga61ORtmMHdreMuBcLzNKLERGsiOF10izExBqjP7ijV/0ccT3Wx9L4aPNlrrbedi
 bFRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRVsV5kLSxnmczOwlC08fdiD1OhAaPOCyVKZxkxyK32YhqiH2ZdGSq/CRYp7+/HquC/8bVRdH61q5XPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJtBrCdtlpr6DjZblQ64QVd7d15GHm3bEdcmWuOf6C9tueJQGp
 IBDH08QaJaNeXiDKht8YQ1tAgZA5adl15d0MgvdjNkLWThcFS4dhhRGy
X-Gm-Gg: ATEYQzxThcs16gt/c/yMVIlOCEuafYPrJKgt45ndb8j48NSRuEvDYch0BnlqP6cqZ6E
 dK9qvbBD9H03B0L3YxFU3eRMInijx2bF0A5WntY22YN2SxDIJ9X9zNYmeUVdN9qPHXVfLQbweag
 okW9P7d7Y6iXioKt3gua/Q8rnrYKwPRwikHZE2n2RPXMfAH0GIHhyqcD0IQAZBsCc/44H2CwJyO
 GM/MZ4MKLSZ+uAx32KC5giUogXYsOH3H/VNaqsGfp0ETGj5uwVNUOWh7TPPobgZhenMMDWy9kqS
 N0A/Vw4vhe1wyYUjn4zbUfDZ7cNlYEb5vp/kpwYfUUXCVx1mAFk4cnALuDP+BrxuZ4dY1E/tCCY
 C+i2Lxs3SUw5RI0FhCrDObjHSc/L1ykBJVpjOv0b7Hkie/NTvAzEVP/JOs9h9ZB0oF9lksaSULe
 kdMS6r6ZngEvFIig==
X-Received: by 2002:a05:600c:46c4:b0:480:6612:253 with SMTP id
 5b1f17b1804b1-483c9c27367mr29499615e9.3.1772206744631; 
 Fri, 27 Feb 2026 07:39:04 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfba9566sm97450615e9.3.2026.02.27.07.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:39:03 -0800 (PST)
Date: Fri, 27 Feb 2026 17:39:01 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260227153901.qor4rtvtxur2zywh@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUD-0000000AuPE-1l06@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vvkUD-0000000AuPE-1l06@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 4/8] phy: qcom-sgmii-eth:
 remove .set_speed() implementation
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,nxp.com:email,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1DBC21B9F81
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:37PM +0000, Russell King (Oracle) wrote:
> Now that the qcom-ethqos driver has migrated to use phy_set_mode_ext()
> rather than phy_set_speed() to configure the SerDes, the support for
> phy_set_speed() is now obsolete. Remove support for this method.
> 
> Using the MAC speed for the SerDes is never correct due to the PCS
> encoding. For SGMII and 2500BASE-X, the PCS uses 8B10B encoding, and
> so:
> 
>   MAC rate * PCS output bits / PCS input bits = SerDes rate
>    1000M   *       10        /       8        = 1250M
>    2500M   *       10        /       8        = 3125M
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
