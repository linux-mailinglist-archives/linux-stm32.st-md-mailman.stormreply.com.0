Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA66D4518
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 15:01:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF8CCC6A610;
	Mon,  3 Apr 2023 13:01:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A6E9C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680526880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qp8jb1qENX7rVnqrJSaV9tv+NNohtm3BMtsMs+alKp0=;
 b=QBkhGe4lWIg9q3pmSt2fKzXCx7gcXbylEzE4CSPljACdXKeI4hQhTu1l5SgokGFXQm1WIX
 G/sxfXwbSOQwWby7bN13fn39oYg3UlE8fNEjVNeebXFVqiYf/FOxuC98Fqa7389BMs4yWP
 A0pY85eBbMDy6pQoLjiC4NpogaLzZ+8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-ZzUmZDnQMV6yNmiOxdk9yw-1; Mon, 03 Apr 2023 09:01:18 -0400
X-MC-Unique: ZzUmZDnQMV6yNmiOxdk9yw-1
Received: by mail-oi1-f198.google.com with SMTP id
 s66-20020acac245000000b003897816aa08so2991806oif.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 06:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680526877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qp8jb1qENX7rVnqrJSaV9tv+NNohtm3BMtsMs+alKp0=;
 b=uDolavSdzwHDKP/CvtXafFgIAaC5K1yKn6RfwAJQMdecYOWk7nnQoyRTSSJWkHpiBP
 9IGfdcu/xRb9QXaGzOjzxgzQovQL34zU+2NeW0EZE12oBZW1Qme8nJd54eXza0CPXsHh
 yiwiDwrWtgad1TDDQDr4rSbadIvufBH8Uwyb6kOp5ppKq6Cqyw0TDhlQOyfwEchNB/sN
 FTwPSGpT935udKe3FMamD3JYqV1JxEviJ4Ds6HYBtOpDhm6XZASzkXt1mrym4dFz0Lt9
 Za5mtWcGpl31vjC8OdAKQOtRJhrKt9AnlbLJqRLBC2g5eDD5ibKfMU0hSEpp3JzXkPJn
 J1iw==
X-Gm-Message-State: AAQBX9eEQnHxBz0FBICWRMmlH8T36lUkHJRn2pNYSYwDYz/f007899zi
 8ml/JrEF3nnYi3Be2J5IEXHHQUjvYEL2Q+xr9KF3iaf3StDLS8E7KQ8G3Z+A3g55f2R8Ge7jTGP
 bquh41YPoJe3MfIPAU6KNZtRSn6aa0yfjqvbeKBLp
X-Received: by 2002:a05:6870:a10a:b0:169:cbcc:25c0 with SMTP id
 m10-20020a056870a10a00b00169cbcc25c0mr9340421oae.14.1680526877295; 
 Mon, 03 Apr 2023 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVyA1HaKN+sFnH2QwAuA0pQ0vlOfQSri1+XfKwdC7nAbRh3YgkVYvmAZP3E261XxLXanhZsg==
X-Received: by 2002:a05:6870:a10a:b0:169:cbcc:25c0 with SMTP id
 m10-20020a056870a10a00b00169cbcc25c0mr9340341oae.14.1680526876532; 
 Mon, 03 Apr 2023 06:01:16 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 l11-20020a056870218b00b001777244e3f9sm3521228oae.8.2023.04.03.06.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:01:16 -0700 (PDT)
Date: Mon, 3 Apr 2023 08:01:12 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230403130112.53z6m2lmm5lnjsm2@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331220613.2cr2r5mcf2wwse4j@halaney-x13s>
 <20230331215504.0169293a@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230331215504.0169293a@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/12] Add EMAC3 support for
	sa8540p-ride
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

On Fri, Mar 31, 2023 at 09:55:04PM -0700, Jakub Kicinski wrote:
> On Fri, 31 Mar 2023 17:06:13 -0500 Andrew Halaney wrote:
> > As promised: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#t
> 
> Patch 12 never made it to netdev or lore :(
> 

Well, that's no good as I definitely want some eyes on that one :(

I've already gotten _some_ reviews on the earlier patches in v3,
I am going to absorb anything super quick into a v4 today, then send that out,
maybe copy pasting larger questions I have yet to respond to? Seems like
an ok approach.. not having the full solution in hand is crummy for
review. Let me know if you think that's a bad call and just a resend is
better.

Sorry, not sure where I messed that up Friday evening when writing
changelogs etc.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
