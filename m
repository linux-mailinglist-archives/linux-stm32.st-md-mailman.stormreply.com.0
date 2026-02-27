Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO5HLvK6oWlhwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:40:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E761BA018
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:40:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0519BC87EC5;
	Fri, 27 Feb 2026 15:40:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1041C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:40:30 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4832c8f9d87so2872285e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772206830; x=1772811630;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=;
 b=NH6OnWd1ayj556AI38zE49bIyWJdGFYxYhAOZ0RCko5Gh9g5nQdlH+ChA4VM0vsbN4
 9GgeWMBUyZt6jGkrHGuZaFa4U9MczOvUKZ8RdLSsTYEvpCMbYeuW5ywzScPuzrlIQ22E
 w+j/KJR+PdgwWq+iuq6iYnFCW2K7l9Cg5mmm6mwmtM9rAMnuhtRs3G+nJziMLGUjhc7D
 2mWLhbkdKgWUGah8Z/5DtxnzdS46LQiJewjIG6EePtyN/GUBNY7ZmDDOtWy/dx0qm6uB
 wXmcecUFUt46qCenaI0r1fjJYcGRwBtJGANAZTrEPNoDqLZIfX1nGx4eUJYFOoKCB8lb
 8Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206830; x=1772811630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=;
 b=iG++B8XmmlYvLsNzJHgtFLigicajFFhjXkDRS5FVxXqzARLQur/L2wfCqQ7ogjj+/U
 2yWNM8p1Hf6kIqEdrvbUTj22N5dHQtR/P6aycfsC5/1JuOwIZIDY0W5lPV9MWYEl85oE
 6UgLdAjIiaUJ6+ko84QghxTtR6IyN6CcBeS6mzXa5YL8Iu7cd1IbgxSO+AnBI10ZRsv9
 Qvhu29ojGsW0j22RQRh+nsEprOFLI7FLsfKaP8ZKUrB31FXcwFob3aWZr2hRWdlpsHqa
 7+NCkxi9ZJ4Mthr56UROpXgA+giaGx/1KC42NVfkYODoS4GfZE0TFDu3qibu2JHBXot7
 nqbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNf46pwWe9679Dd7EO8UZ4T3fy9imSzSnJHEyd5853FSnbNoeN/PztI3KnmUj3kf+/F3z0Ftvzaz2UpA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyP4YBDZ2/m61lOCsvFv9QvvsxJdBuS30jD3IeArC3XNqfb4Amb
 s2Im3yKRMa5ilgyZeYBbp8MVVySVSEt8Fhu2fc2r0PhUonpDP8cFiSt8
X-Gm-Gg: ATEYQzw9/Kro+/KPsvZqNKkYJALiz/naXRP0JxXADCE8qQFOb7u02cEKTFudEZRWOJ/
 5iK1okQfZYXutDGLo4gh0bMZ4XsIiwC+ei5A4HldUEHXNkzOjsZB47rZ6hiXnadFyUp9NFXr14w
 HZO+KpN1kRbc3DNcOz/sLZ4s96IrJut0otYES3OXEtXLqdVnzFheCWV+BTsjCsLUlOJG+XOiVID
 zeyXUUdkrbOSdrN96hJxRalGXYOO7hCOI+1hyqcDgYvMQf6P1boRJRKSNmjcAi79RAYmdLttsMy
 MGxGwqcyTQqrBjRVmSujDoYFx0w47kx9usDYRyBxsbOoF52U07I7yr2CSwidG6DZN9fFCiAehuF
 qr5TqAXMao6Cq7lPp7sQ1uLGVU/6XU+YlNekVMVr/Gm+dpGdg/5Qn2TbkVta5jZniAZhlVktFL2
 uionyTG12WV0We9g==
X-Received: by 2002:a05:600c:350e:b0:483:79af:ca1e with SMTP id
 5b1f17b1804b1-483c9be0523mr30417725e9.5.1772206830140; 
 Fri, 27 Feb 2026 07:40:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf016sm101582255e9.5.2026.02.27.07.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:40:29 -0800 (PST)
Date: Fri, 27 Feb 2026 17:40:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260227154026.dx364j5scae4epqw@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth:
 use PHY interface mode for SerDes settings
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
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,qualcomm.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 71E761BA018
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:42PM +0000, Russell King (Oracle) wrote:
> As established in the previous commit, using SPEED_1000 and SPEED_2500
> does not make sense for a SerDes due to the PCS encoding that is used
> over the SerDes link, which inflates the data rate at the SerDes. Thus,
> the use of these constants in a SerDes driver is incorrect.
> 
> Since qcom-sgmii-eth no longer implements phy_set_speed(), but instead
> uses the PHY interface mode passed via the .set_mode() method, convert
> the driver to use the PHY interface mode internally to decide whether
> to configure the SerDes for 1.25Gbps or 3.125Gbps mode.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
