Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7922AA70EF
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 13:53:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B640C78025;
	Fri,  2 May 2025 11:53:21 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C01A8C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 11:53:20 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-86fbb48fc7fso450266241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 04:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746186798; x=1746791598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dvv3aZc6ysvtM6PaScZm0AZ9BZs2r0w8R3h6Sq84JNU=;
 b=Rx2X/NME0u3nnIq5pY1a/dB/qVimbaPXhZMc3oHm06yndCrp1DgbL0xsjwc6+DHGRe
 WZMtMV6CGQhHfE+jipfpKzT+YYn7//+pZ5dC4KvWQjmJim9v2wSQtEPA3p86CmP0mNdx
 aBIjD+e+AG+nVYYoyQGwHBUEe3OrKD7clCeWw6933zNpZGs0uYMIDl+BCFVtGOMreiaU
 sO6H27tQmI1+SZTfNoSAHfYBj4gYoKgOGbyo7KiF9hUFfdkiR2BG0ESZYrXMUw/YhlLV
 YpP55iWpPf2XUn7mnrZ8SD2K8Y3Zl+K8ALzOlRNeoDUYS3LfKgo1VsV0xiadf/eyv24S
 RQyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXzvJSb3xj5yXiE6vzQakLPelxi90+54Vo8O0xdLBEXop0WroGuli2ExD+96KJlvH1G7G8/YMXlOAGlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7hdYgS4ZcOXNhL1CIPs58L93wqad9kBrtvpQwgOUPHeiNXriC
 h/g9tH6DvAWm4fNWDMn/zP91fdwIPhV+BuOg2x/IZ+TKbaaXM33G+woL0YeM
X-Gm-Gg: ASbGncvaQiqpayBrHNhCGRzDaks3stji5DRl9CGX2vG4phXTfgUVXSXuPQuLC5k8xyV
 FDaK0cdE1G5TulAd6xeDWl3+KKmtucfRHDZOetdfQVs4GMbUZdvajnxEYvyAX5Lr0vgYP14Q/8/
 Pdr3SFR9W6CI1pKJuiGVZAnjC8e6rZVQoz1B3RrmtCNiIt1cWMaHZOGp23E1+IlgIQBMMjd39DW
 g1D68vw2vJKLU35H+J6WGhhb6zl+gka3hNR90TKpaoTAS2QQOr5SrKKMUqcwBEkg47ZtYTu2eeN
 qnxmbBEchh1wuoaDk6fZcdA04YaT3YV69f5AE92di6U7JpVbiXa8pjLVxRWJ3Rj4qWoUhuVMsre
 PVlQcxzvlKPqJNA==
X-Google-Smtp-Source: AGHT+IEiqgIB0LdVVGwVzA6G6kO4NLB4tc5wl0Sht6+8yEGk75oxGECx/gRUCWbZBr4VxUCNqqDOBw==
X-Received: by 2002:a05:6102:4b1b:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4dafb4f7276mr1460658137.6.1746186798340; 
 Fri, 02 May 2025 04:53:18 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4daf2675785sm397401137.30.2025.05.02.04.53.17
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 04:53:17 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-86f9c719d63so498696241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 04:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkQXoLFczXVP2s0WhAcJ1xDBjW25gEUX2MPwFcmUT2WDlkyNQU7MT0gKYjkeripIUcMcCW4DOXkINi+g==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:5045:b0:4c2:ffc8:93d9 with SMTP id
 ada2fe7eead31-4dafb50dd11mr1438920137.9.1746186797387; Fri, 02 May 2025
 04:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 13:53:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
X-Gm-Features: ATxdqUHd8V0pQvGYSlvvIMPnGrAT00VG3I_OsFOHO0G8lVIaFANIhY-BWLZCXg0
Message-ID: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: timer: renesas,
 ostm: Document RZ/V2N (R9A09G056) support
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

On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>
> Also include RZ/V2N in the list of compatibles for which the `resets`
> property is required.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -26,6 +26,7 @@ properties:
>            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
> +          - renesas,r9a09g056-ostm # RZ/V2N
>            - renesas,r9a09g057-ostm # RZ/V2H(P)
>        - const: renesas,ostm        # Generic
>
> @@ -59,6 +60,7 @@ if:
>            - renesas,r9a07g043-ostm
>            - renesas,r9a07g044-ostm
>            - renesas,r9a07g054-ostm
> +          - renesas,r9a09g056-ostm
>            - renesas,r9a09g057-ostm

Looks like we have reached critical mass to invert the logic?

    not:
      contains:
        - renesas,r7s72100-ostm
        - renesas,r7s9210-ostm

?

>  then:
>    required:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
