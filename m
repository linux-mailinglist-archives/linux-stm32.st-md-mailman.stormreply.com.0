Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OINcOMi4oWkYwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:31:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630E1B9D06
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:31:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 500F7C87EC5;
	Fri, 27 Feb 2026 15:31:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B009C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:31:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4399567ea8cso141334f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772206279; x=1772811079;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=;
 b=Xy+w4XkSdgx/QUVb/l5g5KiFs/W0c6MVEuWFQkripAofWEt3DoWSkiOauonydJsBzi
 PWf5+cNRjIq6iYnagwCBBxrncbPCAwqNLIM0nLY8yI7xHMjwXajwHfPP5tZedwM4Ush9
 Fpvs7YjWnJy7S2QMMXr6jdS2KGCA1mry/iNXGPOQ8ceQYY/s/NBG7gT2yQ8qXQr4i3Iz
 SuYsLwAUMP2PjydYXMDPqXp6Q+u2rFIW2eunalTDt05S7XiHmzC/XovODEeofTGYR+TV
 rCButQwKKTS3cI9DWhC+UZhxHWYv1A/KFClQKy1dGW3BfUwKwWd6xvO1Jrxe44Fz05Gb
 ZcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206279; x=1772811079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=;
 b=L7rkNdi5LZKxDkKw+/Duq7guR3J0YQcoDgsoMee4D1uGja1TxeGz6C97vDjyev7z8p
 rJiDPjNjsN4d6ZVDumA0OSgSFw6G7o0TpK00185YnP7iSx0cfevTjcJRClqy1qMC0oYW
 RqVRoAVPM4htH8XtscSl4mROYQiCJt+Bgp6lnNnJ9WKeHvl45D2lJ+H7FfU8R+cA7bRd
 Ek9Qc200Bad1z+1M+61zn2ZSgvNHEUxnKMkb9WHR3kHkJdfmAXi7+UfIvuq2jmy2UJAM
 6aQWpYKS+CRCvNt1DoGRsMXzSDVnNnKV9uyJYNZtDqPl10fYfpJiF+mmndWXKM6oZ/Xk
 cPLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhJx5JE5p5UiojDYezQYL5lTyqspf73Wr/T1Lv1D5azZdVWk+5AzBpJjWQ2iuInrYP/pjGbBK2axod1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydtdT1xkbFKDbxqukULEywEFEHglRhGw7XoxbMS7eCs9bpM9Yg
 M4fd8s1Uqx7Gq/Pe6ovDWKBkQcwBUYh3QInfLRtJ2oG87Qy11yK/rAJ1
X-Gm-Gg: ATEYQzyptzk0STSWSHxkOi/91o463bkyH774C8s/Q1J8oryTXOiteAvkrhoR3hmYV6k
 N2/HXoK52TXix1MNunC5GsbmxPW4GN73pn8y9xvE3UfCNhNLpOXELbDClrn8+JUUzxLkdmDC/o/
 E7f4rU3m0Bd1KmVQnsLX323nOQhjye3UTSt2702LVMFmBsLJoAilyPJli5oMPZQFSau7aXo2CzE
 6RAW/Hf26Tn3fM06fsOegVopGzJTz3wgWEGyzuswBCqxRvzrASHgaE5kWMhxE7KHf47w+2qyXP8
 7nc38Rm8ad7yDo477WxkgwHZPuGwOSKp/bWTtaxb5FXc21WU/lNug8Ypbh5eiSnmqAFIaKHHV70
 fGWQyUNLHuGH9lGxBjPxSF9izfSR0/BYbmNbzKvHsW6pUscjrpueo4lWep9Gbg5uo8YAQuaOLb8
 83QowKTia9x2L3LA==
X-Received: by 2002:a05:600c:5249:b0:477:a478:3f94 with SMTP id
 5b1f17b1804b1-483c9c29b66mr31520385e9.5.1772206278424; 
 Fri, 27 Feb 2026 07:31:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd70e692sm230573145e9.7.2026.02.27.07.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:31:17 -0800 (PST)
Date: Fri, 27 Feb 2026 17:31:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260227153115.rk7ntq2p4fbjcqdv@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUX-0000000AuPo-3mEw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vvkUX-0000000AuPo-3mEw@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 8/8] net: stmmac:
 qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
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
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,nxp.com:email]
X-Rspamd-Queue-Id: 9630E1B9D06
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:57PM +0000, Russell King (Oracle) wrote:
> The call to phy_set_mode_ext() after phy_power_on() was a work-around
> for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
> phy_power_on() but did not configure the PHY. Now that the SerDes driver
> fully configures the SerDes at phy_power_on(), there is no need to call
> phy_set_mode_ext() immediately afterwards.
> 
> This also means we no longer need to record the previous operating mode
> of the driver - this is up to the SerDes driver. In any case, the only
> thing that we care about is the SerDes provides the necessary clocks to
> the stmmac core to allow it to reset at this point. The actual mode is
> irrelevant at this point as the correct mode will be configured in
> ethqos_mac_finish_serdes() just before the network device is brought
> online.
> 
> Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
