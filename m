Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AF96F47D
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 14:45:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59A89C78013;
	Fri,  6 Sep 2024 12:45:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0172C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 12:44:56 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c254a544bfso238155a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725626696; x=1726231496;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FR5utfavmHvvMykUAYOB9LOqH1d3Vi9V/rHk+vjmNqw=;
 b=iDoB3doG9TrcrxqUysIwmiofuYMDhvq+gkXPxrirSa48IBNIHtiIJ1IfMYrfHxpA/z
 n97UiX3vU+67B0OMNNdtslw0b+MF59aJCHgWIiNZWI7FOjdWi6UZDHnQcoueVNMxsi8G
 tx3lHqDBGBq4kwYjv0FhBhj2HvRgcYsRy6RFFCEOcfFVSnSEEAdhCAS/A2T8GQLy8xin
 /ebsT5v1aaaFAickg4eQ0O4LNjDYMys1UxEOxaVrUoNLY4oSLN1tDLN0pL+Qu6lBerXS
 LkMB6R9F1uQyhqZyiHpNPsueS2Ak6+6dUfuNxtc2fIZCyXHYfl46aNU5z9RYqH0XvMPR
 Z0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725626696; x=1726231496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FR5utfavmHvvMykUAYOB9LOqH1d3Vi9V/rHk+vjmNqw=;
 b=Lf23DFWGWDR3Cb8NkyUfSx5oiaFtwGhPysja7EoHxPg3cLk+J00dusCNnz/dP48hRt
 9/18Iyfwe7rhl/LzPmmqwiRqxKAW87nm965JVhrP0XW5+Gz722mUOcbUhgoA+n6t/jr5
 t62Nl2E2u6YwoPtxXMIdLs4QWQ2inU7kBSfkkoWqRpIRoVryyBraVsRh8z9eIPOXoWZU
 lfMgOjMzHlX53WdyGzB7PzYANeje/aefM1/KO+eSevKHsTbiibHeskGgHR4tVwquli5l
 QlgRxWTHARffEf+QIMrm40KewC2T8r1yodfwEz8uJFXOU6GPiZvF0feBsiCzJPtVndG8
 XHqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRnS5A0QPPbrqU5P0wgLdJ6Gk0VCuMkztdJrrnNhynkQykpqgpcd0DwYboBKwe+lVXd1cbqwsXbSfPSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw67LEg7sef+e2b2vZYhsxcJ6ssqWHamDEWKxz1w4Jr4TmI+Z5A
 NF2Ldyp5B9TmUP6hB/7Y3hJiZYlYQ9xMTADbJRAp9BUyZE81oSHk
X-Google-Smtp-Source: AGHT+IGEdOn38Q31+dL7A/iwOSiTP4+o9njLBQY9eVTo0Mjj/K3eLpVKjfaPyeVms9BFO2FSjWYqFQ==
X-Received: by 2002:a05:6402:2692:b0:5c2:562f:41e2 with SMTP id
 4fb4d7f45d1cf-5c3dc77d695mr970016a12.1.1725626695843; 
 Fri, 06 Sep 2024 05:44:55 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a4d2asm2379853a12.81.2024.09.06.05.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:44:55 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:44:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240906124452.aun3ullhvumpzcyu@skbuf>
References: <cover.1725597121.git.0x1207@gmail.com>
 <cover.1725597121.git.0x1207@gmail.com>
 <c8ca90a7b5ddc609ca15a2f6157939176cffb4bc.1725597121.git.0x1207@gmail.com>
 <c8ca90a7b5ddc609ca15a2f6157939176cffb4bc.1725597121.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8ca90a7b5ddc609ca15a2f6157939176cffb4bc.1725597121.git.0x1207@gmail.com>
 <c8ca90a7b5ddc609ca15a2f6157939176cffb4bc.1725597121.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, rmk+kernel@armlinux.org.uk,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v9 4/7] net: stmmac: configure
	FPE via ethtool-mm
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

On Fri, Sep 06, 2024 at 12:55:59PM +0800, Furong Xu wrote:
> Implement ethtool --show-mm and --set-mm callbacks.
> 
> NIC up/down, link up/down, suspend/resume, kselftest-ethtool_mm,
> all tested okay.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
