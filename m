Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GYGAma7oWlhwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:42:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A08911BA133
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:42:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34461C87EC5;
	Fri, 27 Feb 2026 15:42:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E40F8C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:42:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48371104ffdso2910465e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772206947; x=1772811747;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XHBV2WlEb8YlpAeS8vaO1JmiPasxSaE0UWxp/WI+MZ8=;
 b=ZbxXpXqgrA/BMvFOFQhtAD2jpd2sjK4J0V1Q/w6EaaJGNl7sG04qVtmePnWWdkepRy
 tOqm0BOMKg0W7l44T5UYiSlNCpIe/JqXONo5Ugcwwa2R41G5xARrMiAVdpRifckoY8Ig
 EGZNqiBr2/IZ7sjLyK3YP4HpoqnLQm1XY8kCF0z/ZtT76a6yBNAzwo+olRCakaxVGe9e
 ix1PX09xMAn1KfN1+RWb35VVLTpQ+QYF9pE1/D8yAAG3AsQWfAqy9rcy47+PrsHXOkDC
 FN7Oa+20GVrZ2Peb9Szlqi2gwO4kWo4Si8uQPiKefReCRUsWaM8jQCt/EagUXlDErb45
 i9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206947; x=1772811747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHBV2WlEb8YlpAeS8vaO1JmiPasxSaE0UWxp/WI+MZ8=;
 b=SBVoWCZLR7SGaUz6KcDUSD0Ius/w5GxzpygOZO0zYpHrsdxkDENKio07NnC0zBiQ6G
 RQWbK2aKKEarOeRdHizm9DBaPFvgPIRlewC0Gxkz1npEl+I6vnOtwSApkFtamt5mJNAP
 hJ/M2JmKishvCP7A4aCtmn9hORvinHnIOUm8VAQ+PtUlFdyZOXQk3XZ/HgN6C6igDIiU
 mYqkYzJz71nGeopbSrLXMh3KFwiXqlCgmeRdZgFHsC+D0nBbgdVkwHu10R7pbg5qQvo/
 MRb2QHX2KIAMF4jnNHuWvGaxm9haCi/qtpIVhVkkAJkZS2CbhUrEzAV8OGSecKK9rQX9
 tCgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp+WGOm087t/UV3RuQxWi+yRrc/Um95d4TL1ZHibh9ZgZgS2oL4RS8lZ1OzpWCScY7fgRfXIRhxAhjrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxcuIVz1Dcszj96D1Sg/43JrJvkRA78VTm+ydiNScJaLhKiXxl
 opkVMJCtXlR/Mmi9FxmBJIU3wnFtb2HiplV79hZA6VUQRTCtQDZBWBdF
X-Gm-Gg: ATEYQzwv+bkKA+NFMFWZrw4XkEbwmDuh6WsAJUUC+8g4dqCaUpsF9FRemhJIfn51dqi
 0qsq58gCoGzAvXScT701GNguAQE/x850qSswljjEbn0dgDPeoe2aNfo/LBTIsafT/bZQv4gbnD1
 x9koFAtgQUjxf7PXGSS1y32On2YYpFWFwdLw3fZFBFrmHK6pJEEf3cc7nM5JLWKt2ZrovkUxvcb
 AVWOnx+uR6NuWQv05pRiLAQj5k1ablcsfnFfUE9CXlDlMco2dJv6mDtRgkxVKTjhTumaQCp5Oix
 llJac5VfKhnd+fsGuQPo4HxtTfNsC04JCSHkgEyRgJo10NRYxL1Mcaii8pbHfVnjQlh6eUpQsr+
 uj+fpVWIoPoSUqV0kbMifdwDd0+TWURiFOoi9mbhn2WHkV8BIPZoCpsng+Yi9yYEwsBnZ4LN14q
 pTCGKbAblJPy7BAw==
X-Received: by 2002:a05:600c:4592:b0:46f:ab96:58e9 with SMTP id
 5b1f17b1804b1-483c9b7fadcmr29575125e9.0.1772206947165; 
 Fri, 27 Feb 2026 07:42:27 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c60f764sm7600585f8f.3.2026.02.27.07.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:42:26 -0800 (PST)
Date: Fri, 27 Feb 2026 17:42:24 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260227154224.erj32n2kmwvv5xgl@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
 <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
 <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 6/8] phy: qcom-sgmii-eth:
 remove qcom_dwmac_sgmii_phy_interface()
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
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,nxp.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: A08911BA133
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:47PM +0000, Russell King (Oracle) wrote:
> Now that qcom_dwmac_sgmii_phy_interface() only serves to validate the
> passed interface mode, combine it with qcom_dwmac_sgmii_phy_validate(),
> and use qcom_dwmac_sgmii_phy_validate() to validate the mode in
> qcom_dwmac_sgmii_phy_set_mode().
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
