Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6E508887
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Apr 2022 14:54:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E3AC60492;
	Wed, 20 Apr 2022 12:54:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 979D8C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 12:54:45 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id n18so1697780plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cfKEQXfvPhG1kZ+YpMF2hReHRJMEZQRtVI8gWHNwJsE=;
 b=SJ9wrEqPvYtvq6u4My/rceS5j/aS5O0TKpsoPpclCoMwLTUcTsXrjY6k58GgXgJDjk
 tz01T2qFPAHZcwZXJgAwa/uoXApT+ETBGfmmTjkYZ9d86v15pp2JSMJBlS0X/emLIUnL
 FfaBsG1olGj+ebvEzoG/tMRz6g3iydpNPuDMUWlcJE2yd+4v/SWBiXyLES6jNIDlHD5l
 61Z4eLrfFF8CDN43J7Tz5JjM0Q/1AYgpPCyv7abRl+quV72pVPxZxKv/x7sKMu9XzVL5
 SWOxNuWj84mkapk9TS6KdbIbwNAjO5B36W7ddQDXFwsqyW2fnMzNSfySVXaXW0AshHBv
 GGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cfKEQXfvPhG1kZ+YpMF2hReHRJMEZQRtVI8gWHNwJsE=;
 b=E67lCNgslDVuV2fL3ZQmioPUUmktTpYF/FCKAdv+JXRN9/42eckWh2hg9Ew1DNreaU
 M/Uokt68MiunThDLm3Si1ip9vApm0HtwYDxIYAQerVCd4l37nBZTKhAobzIV3iVaFBzS
 FZWgKPOlpIB10ZpyEM8vLW3Q6tkThxKBlpqHwdHk3axjCJSv4jsBM3fQ8Ti2aL2DnOac
 0tTKYdQE9tcs1PntRm6DJ8ICb6y/+mNN/lL/TIAvQPE/MoqCC7/YqWU/bZtp0dY/kAgg
 GcIySzjq/2LdZxgQBTJQH02xL3R48YLRiLBIwxHLLAF9uMDkrbuAhi+pyWn3PpouzZh7
 KfSA==
X-Gm-Message-State: AOAM533oEcmnCMWX53XTO3lsgS31QPHse/nr54SIM8tmfW4mxKX3tjDG
 jfPQKSITClIYnobrOBwVmVs=
X-Google-Smtp-Source: ABdhPJyBl7o+zKhHc4HtlQRcXGENqCIJ11onw+S/lwrewiHQtnsX2ruF+ZGjWz971D6YhQis7geogw==
X-Received: by 2002:a17:90b:4f42:b0:1d2:d1fa:4df5 with SMTP id
 pj2-20020a17090b4f4200b001d2d1fa4df5mr4297398pjb.81.1650459284069; 
 Wed, 20 Apr 2022 05:54:44 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8200:33:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a17090a9f9600b001d0d20fd674sm15955961pjp.40.2022.04.20.05.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 05:54:42 -0700 (PDT)
Date: Wed, 20 Apr 2022 05:54:39 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Tan Tee Min <tee.min.tan@linux.intel.com>
Message-ID: <20220420125439.GA1401@hoboy.vegasvil.org>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
 <20220413125915.GA667752@hoboy.vegasvil.org>
 <20220414072934.GA10025@linux.intel.com>
 <20220414104259.0b928249@kernel.org>
 <20220419005220.GA17634@linux.intel.com>
 <20220419132853.GA19386@hoboy.vegasvil.org>
 <20220420051508.GA18173@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420051508.GA18173@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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

On Wed, Apr 20, 2022 at 01:15:08PM +0800, Tan Tee Min wrote:
> No. The context descriptor (frame) is possibly still owned by the
> DMA controller in this situation.

So that is a problem.  The solution is to postpone this logic until
the driver owns the buffer.  Doesn't the HW offer some means of
notification, like an interrupt for example?

Thanks,
Richard

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
