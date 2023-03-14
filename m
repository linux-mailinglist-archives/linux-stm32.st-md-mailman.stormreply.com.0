Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1056B96DD
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 14:53:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DD16C65E60;
	Tue, 14 Mar 2023 13:53:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B30C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678801996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27KQYZgjkZx3cO9u5MRtjq+WwG0d0GtPOCjo6zjWpFI=;
 b=T+MkSe9kx3BlrRELLxiAlM2xiVqd/Stk1vTOqYJc2mMGeJtN8uNwtixYULjzRz/3rpH4lb
 wJwBxfiEN+V83eflgUOzjafrUCoTrvCdBmngJULK7oyMyl4cXkhY9SDUPODO3kW9EId25w
 LUiiWIl3+bOLDtv71X4cOqUMvabK/QI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-LG6B783QMgK740r6d0J5NA-1; Tue, 14 Mar 2023 09:53:13 -0400
X-MC-Unique: LG6B783QMgK740r6d0J5NA-1
Received: by mail-ot1-f69.google.com with SMTP id
 e2-20020a9d5602000000b00694299f6ea9so7491423oti.19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 06:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678801993;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27KQYZgjkZx3cO9u5MRtjq+WwG0d0GtPOCjo6zjWpFI=;
 b=FGwweJ1K9zggjMTSnDXf8YURa23Ia4di9PTS3rDANs9fjcuK4Bw56/V8yBLNUba17b
 S97oOBvCDFklj1ytKkwBRwoJTrlE3NgLUhHCEXuH7uIe7xEgzHOnGrDQarxU0ceaO/ta
 g+OffP57/qUtHf/U697Qi4S/VN0gqOIWeanpAQnvP0HrjZPRUuTy0OhKoIqcBvr0tZPG
 Y667eiZLUrnoAft1UO+eEz9zOI5uO80Q0X2+xIKTkd12EHbC1Zcjncvxq6oyD6tqKH2C
 B+ZojEy6PWR70mBkP6SYfHNXE8mb/fOXtpfc5OoBixd+yqlQzs5Si2bOFaGLhTZgHIrs
 PxIA==
X-Gm-Message-State: AO0yUKVPkon3OYTChkCtFCtz937M/cIyaQ1PESiyid31V1/jKTF5BaAl
 e+d9TQsoUDBX6hD22rc/hZwCc5/tKgmerBjxCdEP0MfwK5M6rDzR6yTaAujEdQMvw1nxjguUXGT
 /UQReASVRAPgGKVSIYU+EjR/suDbizIjgNY+0sxgY
X-Received: by 2002:a05:6870:40c5:b0:177:9f48:6282 with SMTP id
 l5-20020a05687040c500b001779f486282mr5967645oal.53.1678801992955; 
 Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set865OV+J0WHIBTC/561ECQlv4RbYP6x5QMO3SK6tB+6M0mPsz58Rsx3evTgj9Holgi7Z6/nvg==
X-Received: by 2002:a05:6870:40c5:b0:177:9f48:6282 with SMTP id
 l5-20020a05687040c500b001779f486282mr5967618oal.53.1678801992726; 
 Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 an36-20020a056871b1a400b00177c314a358sm1088290oac.22.2023.03.14.06.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:53:12 -0700 (PDT)
Date: Tue, 14 Mar 2023 08:53:09 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, andersson@kernel.org
Message-ID: <20230314135309.o7y2ofzdvpowu53j@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, andersson@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp:
	Add EMAC GDSCs
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

Bjorn,

On Mon, Mar 13, 2023 at 03:57:27PM -0700, Stephen Boyd wrote:
> Quoting Andrew Halaney (2023-03-13 09:56:14)
> > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> I'm not sure if Bjorn Andersson is planning on modifying this file too,
> so please confirm it can go through netdev tree.
> 

Can you please help respond to Stephen's comment above? I admittedly
don't have much experience sending patch series that span across
multiple subsystems, so if there's something I should be doing
differently (to indicate who takes what patches, etc) in submission
please do not hesitate to be overly verbose in instructing me!

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
