Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A06BDB7E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 23:22:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93083C69053;
	Thu, 16 Mar 2023 22:22:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0D1DC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 22:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679005321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Rowjv41usgCF4QQ+kI7SHFbssbiYFWw5qAQUMEZc44=;
 b=SHTJpmtP4QCzXpF5Y+3qkm4FZKqpslAx6ZFqZzdJ8mDo8xHCtwoxouiiE4Ft11u8rJMvix
 n75o9cITMTcYjst1fBRDjhUnDZQqPuhtXFl7iLpCqS5ktT3mDV0ekbxIK4EMRBEfApqSRU
 KD2ovTrz7VWMuJ0OslHV9MELp667acg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-w6pGYijQNNO63URX7ruNDA-1; Thu, 16 Mar 2023 18:22:01 -0400
X-MC-Unique: w6pGYijQNNO63URX7ruNDA-1
Received: by mail-ot1-f69.google.com with SMTP id
 a11-20020a05683012cb00b0068bdd21c8d7so1393565otq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 15:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679005320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Rowjv41usgCF4QQ+kI7SHFbssbiYFWw5qAQUMEZc44=;
 b=mJugQV/K14Zqf1LktIwF+ToSU/BmytK0Zv1zu0zGxQngBP1QKwrQTgcyJHMLbl9pd+
 QcNTFrs+3rVbn6cpbPsEhLyyBhWFjdXwxPuozZHj3m8Voyf15DmyRYE8eAxdyCzSxAXU
 gvBl8WIrZ0r5vFWDJ3B0sSxPE/esNesOMk9Lxp5lFIhbHZ0VOJIbnw/Vfpn1py4gOFY8
 V3dEJjK3v0UO9t0VjulKNNPpSO7J6Lm6qmcnppfPH+yoGzlU/ux3L+/h9hTAJguLii4a
 dURlQ7NnpEUB3R0zv6IJJHPyAyV9ivLTWEGV1Z4dfI8y+s2cND5rO4HLwG8luU86n4AE
 MHQQ==
X-Gm-Message-State: AO0yUKX7oE6DvCtJNskzjIOhUT3QzzmV/hr2Ieb+bo1e+Wyi0xjcU0Z4
 55AFjwtPqPm3dGkXNHTFFuHPVVpyvPP55focZLZkLeojHqfLo9Cl4hMXfC1e5Wy5Z2cqpJuZeZ2
 7cYkRDG3Hiy/NNOZQxhCgzPaFbvPqtr1oRfVgY7l/
X-Received: by 2002:a05:6808:288e:b0:37f:ab79:a18a with SMTP id
 eu14-20020a056808288e00b0037fab79a18amr3573027oib.6.1679005319341; 
 Thu, 16 Mar 2023 15:21:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set/j+kh5lDpmaLzdIllCWV+e60+QESfodsxPJwbhNxsMnnYpD889YVRRc7aq7J3P6t24SdXMeg==
X-Received: by 2002:a05:6808:288e:b0:37f:ab79:a18a with SMTP id
 eu14-20020a056808288e00b0037fab79a18amr3572986oib.6.1679005317656; 
 Thu, 16 Mar 2023 15:21:57 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 r130-20020acaf388000000b00383f58e7e95sm245725oih.17.2023.03.16.15.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 15:21:56 -0700 (PDT)
Date: Thu, 16 Mar 2023 17:21:53 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230316222153.43wzb4nv7s4d3wwz@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <3f37eede-6d62-fb92-9cff-b308de333ebd@linaro.org>
 <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
MIME-Version: 1.0
In-Reply-To: <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Topics: 
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 netdev@vger.kernel.org, andersson@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net
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

On Tue, Mar 14, 2023 at 11:08:18AM -0500, Andrew Halaney wrote:
> On Tue, Mar 14, 2023 at 04:13:18PM +0100, Konrad Dybcio wrote:
> > 
> > 
> > On 13.03.2023 17:56, Andrew Halaney wrote:
> > > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > > 
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > ---
> > Was it tested to not cause issues on access on "normal" 8280xp?
> > AFAICS if there would be any, they would happen at registration
> > time, as gdsc_init already accesses its registers
> 
> No, I've only tested this series on the sa8540p-ride. I luckily also am
> working from an x13s, I will use that to confirm nothing strange happens
> with this applied before sending v2 and confirm the results.
> 

Writing from my x13s with this applied, things seem ok to me :)

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
