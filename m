Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 734ED349F2D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 02:54:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D470C57B5F;
	Fri, 26 Mar 2021 01:54:29 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97337C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 01:54:28 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id x16so3908756iob.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 18:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTUCdRdUm0KHkgtUEtfz6t9BK78GKOREEwvml9BKNmw=;
 b=DLLlfab6j71ACe4egQhHoCKHNSUXFaq2XV3tZr6pnstZXPGnFjwfjBLmQpptWWFUs9
 S3QFn1EaVLUOvQ2cEwoc0PBa3sjxIEdOpXayMUgCzwSsWIo3i9L6wLn+ZQrZ4eejxhLq
 hgdEtQ0sN26fB1+dGcbypJ0JdI2qv6+tjhHXJoJAf2+LacRDqmc2PcDH0egOQ6B+UvhB
 4513U7d4hoaWskrKTSuqyst6rTDKbezD7MMDGvDh1ezncek5xgvqZLnstkolo5DdedHx
 8Vft4sIGPE5b8ue/4JplTr8vCLCEJ9uAvodo6LdijBTFlEnSd8PK1aZoHmc9cN85QTJp
 95QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTUCdRdUm0KHkgtUEtfz6t9BK78GKOREEwvml9BKNmw=;
 b=kpSmaIyx6vjfhMBmnPDrS7e5r+LK4pZrJaK7y4MerQwDUWFCKDm154cQ6a5iZmDLoi
 QJeV9ddXo8iqbjISHRwwOB2/t2efUMJZxu+w1TvoYkPmv81yj2gD6qxWdnjLO4UFXeye
 jlhdvkC8CHmW53P6ohdpIIRG4swm3GvIgAm+XiYqjsw+x2W+k6BMo+fw9KEuCcnS1OwH
 PZpyaDYJ758sEvElzGRtr54BIniOenh4kKMcAqyOdd5g95rKWLDvcd2vn7UPmGtl8GJG
 atZUi98UbooC5P3IFbmin716TZr7GKm9bCiazTR7SbtO3dvarJZdRXqFAdOQSdR+rCxM
 toRg==
X-Gm-Message-State: AOAM532pCdP7LnRNFLL4GGFuT69bwX4jr58Jj6vao16C5JcURKvuqZ/6
 CScb7aK/giPBwBpHDPrVGO33iJ+W/XIxDUhyffE=
X-Google-Smtp-Source: ABdhPJzoHDPPf+f9jNe8NmkUB1RfzN9mrASTzSrBEBN47liOngOdxnFKWcUbuNkSnWm5DIcL9Mgv63QSpQL7pPdMqlY=
X-Received: by 2002:a05:6638:dc3:: with SMTP id
 m3mr9892355jaj.130.1616723667467; 
 Thu, 25 Mar 2021 18:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
 <1616653162-19954-8-git-send-email-dillon.minfei@gmail.com>
 <068cb7ae-9afc-606d-2579-189e46516cd5@foss.st.com>
In-Reply-To: <068cb7ae-9afc-606d-2579-189e46516cd5@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 26 Mar 2021 09:53:51 +0800
Message-ID: <CAL9mu0JO=HyBmH2UR4HoYUWmdSDLhetVDrBSXoMoc6Edy1JCJw@mail.gmail.com>
To: Valentin CARON - foss <valentin.caron@foss.st.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rong.a.chen@intel.com" <rong.a.chen@intel.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Erwan LE RAY <erwan.leray@st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "afzal.mohd.ma@gmail.com" <afzal.mohd.ma@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "lkp@intel.com" <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH v5 9/9] dt-bindings: serial: stm32: Use
 'type: object' instead of false for 'additionalProperties'
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

Hi Valentin

On Thu, Mar 25, 2021 at 7:12 PM Valentin CARON - foss
<valentin.caron@foss.st.com> wrote:
>
> Hi Dillon,
>
> It's okay for me.
>
> Regards,
>
> Valentin
Thanks for your test, and quick reply.
>
> On 3/25/21 7:19 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > To use additional properties 'bluetooth' on serial, need replace false with
> > 'type: object' for 'additionalProperties' to make it as a node, else will
> > run into dtbs_check warnings.
> >
> > 'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
> > 'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'
> >
> > Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Tested-by: Valentin Caron <valentin.caron@foss.st.com>
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >
> > v5: accroding to rob's suggestion, replace false with 'type: object'
> >      of 'additionalProperties'.
> >
> >   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > index 8631678283f9..865be05083c3 100644
> > --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > @@ -80,7 +80,8 @@ required:
> >     - interrupts
> >     - clocks
> >
> > -additionalProperties: false
> > +additionalProperties:
> > +  type: object
> >
> >   examples:
> >     - |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
