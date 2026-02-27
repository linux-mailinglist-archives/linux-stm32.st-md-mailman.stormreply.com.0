Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALjgG0q6oWlhwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:37:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F751B9F07
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:37:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8EF4C87EC5;
	Fri, 27 Feb 2026 15:37:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 522A7C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:37:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4806b88d8c9so3066545e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772206665; x=1772811465;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=;
 b=EaEmIZNDWvDPs2VdXQut3jEYgpXY2LwGq9KupYuNJD0YmBe58w4bgPB+tXbwtUrE4a
 zHDHJg6LqOvpJ9fOVuVzrqAXq3rr+hApbx/o9cEMKOkJqdgv2ZXmoar5hsjcxQHZs5Sd
 TruO5PucWZnuextJHDk0RBTm5HIFn2/19VVT6XbOKFJ0k8GGbXmfZcLM/Ecs13vGN2M9
 goEKs9Oh4+WmQv+3FTUCDTkrs9rdC2am9D5s5deo9m7CAHoDAmE0+2qeypVsK+/vOwXP
 0GKBSJQ+NMypIDEZuELLXaU/Ec72B6bLsNCMfdln1vk005jX9sXflmGjCqTqVMogg+dp
 bo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206665; x=1772811465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=;
 b=ANNJJuk7I661+RvNZST81nstAZq1PcmDukRzKiJoNmrJKHWfzFHJjbKdJ4fjFf8qym
 j0eMJqEB8PbwhprOWnZnNp7EnSlNyZaJ+OKhDXrN8VpZ1ojy6fM1bBnDbOnaKSsmslKY
 m//3I5mzVANy+WeQ5XdxBkI8sMfKo44SNQLJ6oZC9V8j0tB5/cgbWUPNd1tOUW36L6wx
 88Q6YJlQz4S9NCmhhoeTps9EnxSStHsVttRgnhNUOb/xwPoZL3dsTliP0e1NvA/nVJJ0
 sofAkJHE0bUhepgseriZpZ7V9KCeeTA+53Gih210nWztTDYWTZNxiyMU5BPeKIpEnjgO
 k2yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbUWBSDoMnaqcdAmK3W/p5Z/8nLDSdfuvB/r1qOHeujlt4HKhABOGEN7JZ3OrpgEeeV/LU8ZyffF5hyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLiOLzCnoUIb4d3OXV6wDAR40PTwzG02OrG85II1nGF92eTmKc
 gmCm8LsB03tkvAPdpDQBOOPUYkUbBgXMsKE1f76B1ZnOD3ynnS7EHyvf
X-Gm-Gg: ATEYQzyJ1USEclMwupvwXxXuTpKr7yEsz6ckmulVMhmmakgwOpDCYSkshcESuszG478
 XvDOatpdDyborpb4EcU9Spvhcnp//Im5JiaIDemr4sqmdn5vnnFGOegP0JecaRlUvplwaRcVqDk
 s5QGgjZZPT07bki1CTE1cxKgFyR7NuBNZjgo1bsmx8wnLK7QAgIiIzCmIpUxNLSVEJX9gkyanen
 sZPmdIl+NjK+RJDn6NJDsjIYfGpcEn/dRzS209150tJH+GxbzKyxSlX/1dNvNIaI70Dr8DRhRo8
 WsNBZoB62288MLH+2WI2AYTB8R0DucfATSXksFh1jvcfcBYgnAhqXQkvGQ8hBCppR9C+4GHzDjZ
 cz2GUEWnOdjh/9q2j82XqJ3hzfvRJM6wvWnuTpEK0OuFwo+lJRZmf4cIvUcqX+gZySlmdmdLNg2
 gsbnHyDhQpySc/bg==
X-Received: by 2002:a05:600c:444f:b0:477:a6f1:499d with SMTP id
 5b1f17b1804b1-483c9c1bbdcmr28085255e9.3.1772206664464; 
 Fri, 27 Feb 2026 07:37:44 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb776a3sm84332245e9.7.2026.02.27.07.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:37:43 -0800 (PST)
Date: Fri, 27 Feb 2026 17:37:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260227153741.e462gzmv7t62r5uo@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUS-0000000AuPh-3Il7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vvkUS-0000000AuPh-3Il7@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth:
 relax order of .power_on() vs .set_mode*()
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,nxp.com:email]
X-Rspamd-Queue-Id: 12F751B9F07
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:09:52PM +0000, Russell King (Oracle) wrote:
> Allow any order of the .power_on() and .set_mode*() methods as per the
> recent discussion. This means phy_power_on() with this SerDes will now
> restore the previous setup without requiring a subsequent
> phy_set_mode*() call.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
