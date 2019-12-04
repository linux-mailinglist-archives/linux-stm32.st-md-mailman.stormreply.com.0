Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22618113766
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 23:01:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C09C36B0B;
	Wed,  4 Dec 2019 22:01:38 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77A7EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 22:01:37 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 59so679963otp.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2019 14:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qKR6o4UGPy9iqIfUp6iJ8SJ9UqWScNbqbObfmkhLaUM=;
 b=DMSIyYnK06y68kkk5SpMY6sjzKfQE/2nCUoYnkyPpEWnjmwEfZPSR/ZwzhYHrssl7q
 2/UgK0gkWqoZZ++NFNN7L9XLo2IOnGhb6SK4BVITYW081Naz1c2bo4UT1JC3lx7/8MfP
 iwmjMV/eRcFc2g/xPaMMVr4DMvAFgOPUjo6lf1quFdlMTH3djsEFkqildCDXJzQpAnal
 36qxI9ibvJCkYsi3H//JBYyDOsoRgicsNCzAg8Rjq312f6lSQM7jdGntseAubMnHk+49
 KWtEIHsfFvKjnn/uos4AOClhty78cVy5xE5KN+sijqaf7K6kI6CEJC+L7KE4G6aQo7TX
 b5ew==
X-Gm-Message-State: APjAAAVg/UCgnpZpFUDUKBvmaZRqJLorU3vXnIHEFlmJFnw8tF+Jxupr
 do5plpVWETYsNTOwWqgJvw==
X-Google-Smtp-Source: APXvYqwrPt2PI9ParnlGucs0G+mALP2GoBO6N+l83sOY7Tbcy0oTsamiEFYR6brfLpKlt++s6q558g==
X-Received: by 2002:a05:6830:1211:: with SMTP id
 r17mr4309425otp.157.1575496896226; 
 Wed, 04 Dec 2019 14:01:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i15sm2625353otl.69.2019.12.04.14.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 14:01:35 -0800 (PST)
Date: Wed, 4 Dec 2019 16:01:34 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191204220134.GA25911@bogus>
References: <20191122104536.20283-1-benjamin.gaignard@st.com>
 <20191122104536.20283-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122104536.20283-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: regulator: Convert stm32
 vrefbuf bindings to json-schema
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

On Fri, 22 Nov 2019 11:45:36 +0100, Benjamin Gaignard wrote:
> Convert the STM32 regulator vrefbuf binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> CC: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  .../bindings/regulator/st,stm32-vrefbuf.txt        | 20 ---------
>  .../bindings/regulator/st,stm32-vrefbuf.yaml       | 52 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
