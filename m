Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C0123B1A
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 00:48:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49D1CC36B0C;
	Tue, 17 Dec 2019 23:48:07 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C234C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 23:48:05 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k4so129114oik.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 15:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tutk/Fdb9yvvc0d6ClJQt0rt94NZhM3GPxr38qCafUE=;
 b=SzC0Vto67sM5QM5Xdr1YMP6E5NKczGORzExjyWrg1BnaxLbxPDpzsfmET4mNUrctuy
 4l1b9iW/9uvAaISNhiIWFeXswXWpVYttgAx2inYuz3fgqPXK+z7NUEuz4eSZcDG3eomI
 4d0/r8t69WqX2RuDtH2wWXZ0I1XhOp3zqeQi0kGnlue3jsKBsaxMEVgk/vd1kKZOCJr7
 pKB+IFd5e9fiuewRE/+EfKfStOrXkcfWKQjT9q6luWMQBZNLaua/OpxwVU75hxZWvazg
 2fWdjw9Qt156Cry7KGWR3Z91Jyyh9cdkiMpQGQESepS/6lE3tdoV3apuVal0ob4apN5p
 C3cw==
X-Gm-Message-State: APjAAAVbQV0Ysc4OPVdHTCWumaJfyTPwC+NuZdc6xq1kqFm1t1fxAuiM
 v/XL22lqzAjV9lKruUTIkQ==
X-Google-Smtp-Source: APXvYqyP2Fiocy07OTYHl4c41Qrueem8kz4bjMPaTYDoamQglq516HtSZQh0evY8NWPhggZ/yc0W4w==
X-Received: by 2002:aca:b48a:: with SMTP id d132mr3061698oif.111.1576626483838; 
 Tue, 17 Dec 2019 15:48:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e9sm165102oia.10.2019.12.17.15.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 15:48:03 -0800 (PST)
Date: Tue, 17 Dec 2019 17:48:02 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191217234802.GA21307@bogus>
References: <20191214090025.10648-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191214090025.10648-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: rtc: Convert stm32 rtc
 bindings to json-schema
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

On Sat, 14 Dec 2019 10:00:25 +0100, Benjamin Gaignard wrote:
> Convert the STM32 RTC binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - remove useless type definitions
> - move properties definitions in the core of the yaml
> 
>  .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  61 ---------
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml      | 139 +++++++++++++++++++++
>  2 files changed, 139 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
