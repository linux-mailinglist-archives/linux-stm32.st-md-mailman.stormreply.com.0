Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB148A97E0
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 12:53:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DC30C6DD66;
	Thu, 18 Apr 2024 10:53:20 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 187A6C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 10:53:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9034827;
 Thu, 18 Apr 2024 12:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713437549;
 bh=y44ptJ3mDFUWxmkBcurUdX8DIYAovhjAxSbpW9R/eNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M6E1BxnRdcjsS4JSj03zg7VJHuDZPXJ+ccXs0PNg0Q6+F9PZypIPKnmHsM7+MY+QG
 i4OWslc7wfgQ8vqT7fK1OBDEdeUb+3KXLPbYZy4/Py4vKtQ7bl65D6tTnVXUuYzsgG
 Q/FjedEb+g0AcsE72tr78ry7U9NTypqT9lt5kX70=
Date: Thu, 18 Apr 2024 13:53:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <20240418105310.GV12561@pendragon.ideasonboard.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
 <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Oleg Drokin <green@linuxhacker.ru>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Pavel Machek <pavel@ucw.cz>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH 00/35] media: Fix coccinelle warning/errors
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

Hi Ricardo,

On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > In my opinion, it's better to just ignore old warnings.
> >
> > I agree. Whatever checkers we enable, whatever code we test, there will
> > always be false positives. A CI system needs to be able to ignore those
> > false positives and only warn about new issues.
> 
> We already have support for that:
> https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads

Those are manually written filters. Would it be possible to reduce the
manual step to flagging something as a false positive, and have a
machine build the filters ?

> But it would be great if those lists were as small as possible:
> 
> - If we have a lot of warnings, two error messages can be combined and
> will scape the filters
> eg:
> print(AAAA);
> print(BBBB);
> > AABBBAAB
> 
> - The filters might hide new errors if they are too broad
> 
> 
> Most of the patches in this series are simple and make a nicer code:
> Eg the non return minmax() ,
> Other patches show real integer overflows.
> 
> Now that the patches are ready, let's bite the bullet and try to
> reduce our technical debt.
> 
> > > When code is new the warnings are going to be mostly correct.  The
> > > original author is there and knows what the code does.  Someone has
> > > the hardware ready to test any changes.  High value, low burden.
> > >
> > > When the code is old only the false positives are left.  No one is
> > > testing the code.  It's low value, high burden.
> > >
> > > Plus it puts static checker authors in a difficult place because now
> > > people have to work around our mistakes.  It creates animosity.
> > >
> > > Now we have to hold ourselves to a much higher standard for false
> > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > Drokin has told me previously that I spend too much time trying to
> > > silence false positives instead of working on new code.  He's has a
> > > point which is that actually we have limited amount of time and we have
> > > to make choices about what's the most useful thing we can do.
> > >
> > > So what I do and what the zero day bot does is we look at warnings one
> > > time and we re-review old warnings whenever a file is changed.
> > >
> > > Kernel developers are very good at addressing static checker warnings
> > > and fixing the real issues...  People sometimes ask me to create a
> > > database of warnings which I have reviewed but the answer is that
> > > anything old can be ignored.  As I write this, I've had a thought that
> > > instead of a database of false positives maybe we should record a
> > > database of real bugs to ensure that the fixes for anything real is
> > > applied.

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
